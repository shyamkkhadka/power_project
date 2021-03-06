class RectifiersController < ApplicationController
	layout "tabbed_container"

  # GET /rectifiers
  # GET /rectifiers.json
  def index
    @rectifiers = Rectifier.all
		@station = Station.find(params[:station_id])
  
	  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rectifiers }
    end
  end

  # GET /rectifiers/1
  # GET /rectifiers/1.json
  def show
    @rectifier = Rectifier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rectifier }
    end
  end

  # GET /rectifiers/new
  # GET /rectifiers/new.json
  def new
    @rectifier = Rectifier.new
		@station = Station.find(params[:station_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rectifier }
    end
  end

  # GET /rectifiers/1/edit
  def edit
    @rectifier = Rectifier.find(params[:id])
		@station = Station.find(params[:station_id])

	# Display users list for installation team
		installation_team = @rectifier.installation_team.split(",")
		@users = User.find(:all, :conditions => {:id => installation_team}, :select => 'name_emp_id, id').to_json.html_safe

  end

	# TODO: ADD equipment_code to map between equipment table and rectifier
  # POST /rectifiers
  # POST /rectifiers.json
  def create
    @rectifier = Rectifier.new(params[:rectifier])
		@station = Station.find(params[:station_id])
	
		
		# Find system type id from system name
		@rectifier.system_type_id = SystemType.find_by_name(params[:rectifier][:system_type_id]).id
	
    respond_to do |format|
      if @rectifier.save
        format.html { redirect_to station_rectifiers_path(@rectifier.station), notice: 'Rectifier was successfully created.' }
        format.json { render json: @rectifier, status: :created, location: @rectifier }
      else
        format.html { render action: "new" }
        format.json { render json: @rectifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rectifiers/1
  # PUT /rectifiers/1.json
  def update
    @rectifier = Rectifier.find(params[:id])
		params[:rectifier][:system_type_id] = SystemType.find_by_name(params[:rectifier][:system_type_id]).id

    respond_to do |format|
      if @rectifier.update_attributes(params[:rectifier])
        format.html { redirect_to station_rectifiers_path(@rectifier.station), notice: 'Rectifier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rectifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rectifiers/1
  # DELETE /rectifiers/1.json
  def destroy
    @rectifier = Rectifier.find(params[:id])
    @rectifier.destroy

    respond_to do |format|
      format.html { redirect_to station_rectifiers_url }
      format.json { head :no_content }
    end
  end
end
