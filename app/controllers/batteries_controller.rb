class BatteriesController < ApplicationController
  layout "tabbed_container"
  
  before_filter :authenticate_user!
  load_and_authorize_resource :only => [:index, :new, :create, :edit ,:delete]
  
  # GET /batteries
  # GET /batteries.json
  def index
    @station = Station.find(params[:station_id])
    @batteries = @station.batteries
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batteries }
    end
  end

  # GET /batteries/1
  # GET /batteries/1.json
  def show
    @battery = Battery.find(params[:id])
    @station = @battery.station
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

    # Display users list for installation team
    installation_team = @battery.installation_team.split(",")
    @users = User.find(:all, :conditions => {:id => installation_team}, :select => 'name_emp_id, id').to_json.html_safe
  end

  # TODO: ADD equipment_code to map between equipment table and battery
  # POST /batteries
  # POST /batteries.json
  def create
    @battery = Battery.new(params[:battery])
    @station = Station.find(params[:station_id])

    # Find system type id from system name
    @battery.system_type_id = SystemType.find_by_name(params[:battery][:system_type_id]).id

    respond_to do |format|
      if @battery.save
        # Create empty bank records for battery according to given number of banks attributes
        create_banks(@battery)
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

  # Create empty bank records for battery according to given number of banks attributes and cells
  def create_banks(battery)
    battery.bank_no.times do
      bank = Bank.create(:battery_id => battery.id)
      24.times do 
        cell = Cell.create(:cell_voltage => 2.0)
        bank.cells.push(cell)
      end
      battery.banks.push(bank)
    end
  end

  # Display daily reports
  # GET /battery/1/daily_report_list
  def daily_report_list
    @date = Date.parse(params[:date])
    puts "Params is #{params.inspect}"
 
    @battery = Battery.find(params[:battery_id])
    @battery_daily_tests = BatteryDailyTest.find(:all, :conditions => ["DATE(created_at) = ?", @date], :order => "created_at DESC")
    @station = @battery.station

    # respond_to do |format|
    # format.html # index.html.erb
    # # format.json { render json: @battery_daily_tests }
    # end
    if @battery_daily_tests.empty?
      render :text => "No records found"

    else
      render :layout => false
    end
  end

# Display weekly reports
  # GET /battery/1/weekly_report_list
  def weekly_report_list
    @date1 = Date.parse(params[:date1])
    @date2 = Date.parse(params[:date2])
    @battery = Battery.find(params[:battery_id])
    @banks = @battery.banks
    
    @battery_weekly_tests = BatteryWeeklyTest.find(:all, :conditions => ["DATE(created_at) >= ? AND DATE(created_at) <= ?", @date1, @date2], :order => "created_at DESC")
    @station = @battery.station

    # respond_to do |format|
    # format.html # index.html.erb
    # # format.json { render json: @battery_weekly_tests }
    # end
    if @battery_weekly_tests.empty?
      render :text => "No records found"

    else
      render :layout => false
    end
  end


end
