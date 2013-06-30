class BatteryWeeklyTestsController < ApplicationController
  # GET /battery_weekly_tests
  # GET /battery_weekly_tests.json
  def index
    @battery_weekly_tests = BatteryWeeklyTest.all
		test_battery = Battery.find(params[:battery_id])
		@station = test_battery.station	

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @battery_weekly_tests }
    end
  end

  # GET /battery_weekly_tests/1
  # GET /battery_weekly_tests/1.json
  def show
    @battery_weekly_test = BatteryWeeklyTest.find(params[:id])
		test_battery = Battery.find(params[:battery_id])
		@station = test_battery.station	

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @battery_weekly_test }
    end
  end

  # GET /battery_weekly_tests/new
  # GET /battery_weekly_tests/new.json
  def new
    @battery_weekly_test = BatteryWeeklyTest.new
		@battery = Battery.find(params[:battery_id])
		@station = @battery.station

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @battery_weekly_test }
    end
  end

  # GET /battery_weekly_tests/1/edit
  def edit
    @battery_weekly_test = BatteryWeeklyTest.find(params[:id])
		@battery = Battery.find(params[:battery_id])
  end

  # POST /battery_weekly_tests
  # POST /battery_weekly_tests.json
  def create
    @battery_weekly_test = BatteryWeeklyTest.new(params[:battery_weekly_test])

    respond_to do |format|
      if @battery_weekly_test.save
        format.html { redirect_to station_batteries_path(@@battery_weekly_test.battery.station), notice: 'Battery weekly test was successfully created.' }
        format.json { render json: @battery_weekly_test, status: :created, location: @battery_weekly_test }
      else
        format.html { render action: "new" }
        format.json { render json: @battery_weekly_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /battery_weekly_tests/1
  # PUT /battery_weekly_tests/1.json
  def update
    @battery_weekly_test = BatteryWeeklyTest.find(params[:id])
		@battery = @battery_weekly_test.battery		

    respond_to do |format|
      if @battery_weekly_test.update_attributes(params[:battery_weekly_test])
        format.html { redirect_to battery_battery_daily_test_path(@battery, @battery_weekly_test), notice: 'Battery weekly test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @battery_weekly_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battery_weekly_tests/1
  # DELETE /battery_weekly_tests/1.json
  def destroy
    @battery_weekly_test = BatteryWeeklyTest.find(params[:id])
    @battery_weekly_test.destroy

    respond_to do |format|
      format.html { redirect_to battery_weekly_tests_url }
      format.json { head :no_content }
    end
  end
end
