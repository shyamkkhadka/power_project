class StationsController < ApplicationController
  before_filter :authenticate_user!
	load_and_authorize_resource :only => [:new, :create, :edit, :show, :index]

  # GET /stations
  # GET /stations.json
  def index
		
		# Reqeust is for listing stations under selected Accounting Office
		if params[:from] && params[:acc_office] 
			@stations = AccountingOffice.find(params[:acc_office]).stations.find(:all, :order => :name)
		else
	    if current_user.role? :admin
				@stations = Station.order(:name).all 
			else
				@stations = current_user.stations.find(:all, :order => :name)
			end

		end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @station = Station.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.json
  def new
    @station = Station.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])

    # Create an array of RD codes 
    @rd_codes = Array.new
    RegionalDirectorate.all.each do |rd| 
      @rd_codes.push(rd.code)  	
    end
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(params[:station])
   
    respond_to do |format|
      if @station.save
				
				# By default admin user is owner of each newly created station
				admin_user = User.find_by_role("admin") 				
				admin_user.stations << @station
				admin_user.save
				
				format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render json: @station, status: :created, location: @station }
      else
        format.html { render action: "new" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stations/1
  # PUT /stations/1.json
  def update
    @station = Station.find(params[:id])
    
   	respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to station_batteries_path(@station), notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end

	# List stations using group by combination of RD and accounting office
  # GET /stations/list 
  def list
		# Display all the stations if not chosen particular account office by default
		# group_by_rd is for sorting based on RD only
		# group_by_rd and group_by_ofc represent sorting based on RD as well as Acc Office
		if params[:group_by_rd] && params[:group_by_rd] != 'ALL'
			@stations = RegionalDirectorate.find(params[:group_by_rd]).stations

			if params[:group_by_ofc] && params[:group_by_ofc] != 'ALL'
				# TODO: Better modify sql to find by office id as well as RD id
				# eg. AccountingOffice.find(:id => params[:group_by_ofc], :regional_directorate_id => RegionalDirectorate.find(params[:group_by_rd])
				@stations = AccountingOffice.find(params[:group_by_ofc]).stations	
			else
				@stations = RegionalDirectorate.find(params[:group_by_rd]).stations	
			end

		else
			@stations = current_user.stations
		end
		


	render :layout => false		
 end

end
