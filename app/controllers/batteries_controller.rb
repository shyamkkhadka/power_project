class BatteriesController < ApplicationController
	layout "tabbed_container"

  # GET /batteries
  # GET /batteries.json
  def index
		@station = Station.find(params[:station_id])
    @batteries = Battery.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batteries }
    end
  end

  # GET /batteries/1
  # GET /batteries/1.json
  def show
    @battery = Battery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @battery }
    end
  end

  # GET /batteries/new
  # GET /batteries/new.json
  def new
		@station = Station.find(params[:station_id])
		@battery = Battery.new
		
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @battery }
    end
  end

  # GET /batteries/1/edit
  def edit
    @battery = Battery.find(params[:id])
		@station = Station.find(params[:station_id])
  end

  # POST /batteries
  # POST /batteries.json
  def create
    @battery = Battery.new(params[:battery])
		@station = Station.find(params[:station_id])

		# Find system type id from system name
		@battery.system_type_id = SystemType.find_by_name(params[:battery][:system_type_id]).id
		
    respond_to do |format|
      if @battery.save
        format.html { redirect_to station_batteries_path(@battery.station), notice: 'Battery was successfully created.' }
        format.json { render json: @battery, status: :created, location: @battery }
      else
        format.html { render action: "new" }
        format.json { render json: @battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /batteries/1
  # PUT /batteries/1.json
  def update
    @battery = Battery.find(params[:id])
		params[:battery][:system_type_id] = SystemType.find_by_name(params[:battery][:system_type_id]).id
		
    respond_to do |format|
      if @battery.update_attributes(params[:battery])
        format.html { redirect_to station_batteries_path(@battery.station), notice: 'Battery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batteries/1
  # DELETE /batteries/1.json
  def destroy
    @battery = Battery.find(params[:id])
    @battery.destroy

    respond_to do |format|
      format.html { redirect_to station_batteries_url }
      format.json { head :no_content }
    end
  end
end
