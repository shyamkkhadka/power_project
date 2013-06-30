class BatteryDailyTestsController < ApplicationController

	layout "tabbed_container", :only => [:index] 
  
	# GET /battery_daily_tests
  # GET /battery_daily_tests.json
  def index
    @battery_daily_tests = BatteryDailyTest.all
		test_battery = Battery.find(params[:battery_id])
		@station = test_battery.station	

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @battery_daily_tests }
    end
  end

  # GET /battery_daily_tests/1
  # GET /battery_daily_tests/1.json
  def show
    @battery_daily_test = BatteryDailyTest.find(params[:id])
		test_battery = Battery.find(params[:battery_id])
		@station = test_battery.station	

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @battery_daily_test }
    end
  end

  # GET /battery_daily_tests/new
  # GET /battery_daily_tests/new.json
  def new
    @battery_daily_test = BatteryDailyTest.new
		@battery = Battery.find(params[:battery_id])
		@station = @battery.station

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @battery_daily_test }
    end
  end

  # GET /battery_daily_tests/1/edit
  def edit
    @battery_daily_test = BatteryDailyTest.find(params[:id])
		@battery = Battery.find(params[:battery_id])
  end

  # POST /battery_daily_tests
  # POST /battery_daily_tests.json
  def create
    @battery_daily_test = BatteryDailyTest.new(params[:battery_daily_test])

    respond_to do |format|
      if @battery_daily_test.save
        format.html { redirect_to station_batteries_path(@battery_daily_test.battery.station), notice: 'Battery daily test was successfully created.' }
        format.json { render json: @battery_daily_test, status: :created, location: @battery_daily_test }
      else
        format.html { render action: "new" }
        format.json { render json: @battery_daily_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /battery_daily_tests/1
  # PUT /battery_daily_tests/1.json
  def update
    @battery_daily_test = BatteryDailyTest.find(params[:id])
		@battery = @battery_daily_test.battery		
		
    respond_to do |format|
      if @battery_daily_test.update_attributes(params[:battery_daily_test])
        format.html { redirect_to battery_battery_daily_test_path(@battery, @battery_daily_test), notice: 'Battery daily test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @battery_daily_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battery_daily_tests/1
  # DELETE /battery_daily_tests/1.json
  def destroy
    @battery_daily_test = BatteryDailyTest.find(params[:id])
    @battery_daily_test.destroy

    respond_to do |format|
      format.html { redirect_to battery_daily_tests_url }
      format.json { head :no_content }
    end
  end
end