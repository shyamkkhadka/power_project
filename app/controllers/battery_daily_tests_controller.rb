class BatteryDailyTestsController < ApplicationController

	 # layout "tabbed_container", :only => [:index] 
	 
	# GET /battery_daily_tests
  # GET /battery_daily_tests.json
  def index
    @battery_daily_tests = BatteryDailyTest.find(:all, :order => "created_at DESC")
		@battery = Battery.find(params[:battery_id])
		@station = @battery.station	

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
		@banks = @battery.banks

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @battery_daily_test }
    end
  end

  # GET /battery_daily_tests/1/edit
  def edit
    @battery_daily_test = BatteryDailyTest.find(params[:id])
		@battery = Battery.find(params[:battery_id])
		@banks = @battery.banks
  end

  # POST /battery_daily_tests
  # POST /battery_daily_tests.json
  def create
    battery = Battery.find(params[:battery_id])
    params[:banks].each_value do |test|
      test[:inserted_by] = current_user.full_name
      battery.battery_daily_tests.build(test) unless test.values.all?(&:blank?)
    end
    respond_to do |format|
      if battery.save
        format.html { redirect_to station_batteries_path(battery.station), notice: 'Battery daily test was successfully created.' }
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
   
#    batteries/:battery_id/battery_daily_tests/reports
#    Generates spreadsheet format xls
   def reports
     battery = Battery.find(params[:battery_id])
     @date = Date.parse(params[:date])
     @station = battery.station
     package = Axlsx::Package.new
     workbook = package.workbook
     @tests = BatteryDailyTest.find(:all, :conditions => ["DATE(created_at) = ?", @date], :order => "created_at DESC")

     workbook.add_worksheet(name: "Sheet 1") do |sheet|
        # sheet.add_image(:image_src => Rails.root.join('public','images','ntlogo.png').to_s, :noSelect => true, :noMove => true) do |image|
          # image.width=70
          # image.height=71
          # image.start_at 22, 14
          # image.end_at 1, 1
        # end
         sheet.add_row ["Daily Test Report on #{@date} of station #{@station.name}"]
         sheet.add_row ["Bank No.", "Total Voltage", "Visual Inspection", "Reported by", "Reported date"], :style => Axlsx::STYLE_THIN_BORDER
         @tests.each_with_index do |t, i|
           sheet.add_row [i+1, t.total_voltage, t.visual_inspection,t.inserted_by, t.created_at.to_s], :style => Axlsx::STYLE_THIN_BORDER
           sheet.column_widths 10,nil, 23, 23, 23
           sheet.merge_cells("A1:D1")
         end
      end
      send_data package.to_stream.read, :filename => 'report.xlsx', :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
   end 
      
end
