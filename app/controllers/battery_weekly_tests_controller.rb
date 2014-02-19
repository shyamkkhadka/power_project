class BatteryWeeklyTestsController < ApplicationController
	
  # GET /battery_weekly_tests
  # GET /battery_weekly_tests.json
  def index
    @battery_weekly_tests = BatteryWeeklyTest.all
		@battery = Battery.find(params[:battery_id])
		@station = @battery.station	

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
    # @battery = Battery.last
		@station = @battery.station
		@banks = @battery.banks
		@cells = @battery.banks.last.cells
  
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
    battery = Battery.find(params[:battery_id])
    params[:cells].each_value do |test|
      test[:inserted_by] = current_user.full_name
      battery.battery_weekly_tests.build(test) unless test.values.all?(&:blank?)
    end
        
    respond_to do |format|
      if battery.save
        format.html { redirect_to station_batteries_path(battery.station), notice: 'Battery weekly test was successfully created.' }
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
        format.html { redirect_to battery_battery_weekly_test_path(@battery, @battery_weekly_test), notice: 'Battery weekly test was successfully updated.' }
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
      format.html { redirect_to battery_battery_weekly_tests_url(@battery_weekly_test.battery) }
      format.json { head :no_content }
    end
  end

	# Added for jqgrid testing
	def jqgrid

	end


#    batteries/:battery_id/battery_weekly_tests/reports
#    Generates spreadsheet format xls
  def reports
     battery = Battery.find(params[:battery_id])
     @date1 = Date.parse(params[:date1])
     @date2 = Date.parse(params[:date2])
     @station = battery.station
     package = Axlsx::Package.new
     workbook = package.workbook
     @tests = BatteryWeeklyTest.find(:all, :conditions => ["DATE(created_at) >= ? AND DATE(created_at) <= ?", @date1, @date2], :order => "created_at DESC")

     workbook.add_worksheet(name: "Sheet 1") do |sheet|
        # sheet.add_image(:image_src => Rails.root.join('public','images','ntlogo.png').to_s, :noSelect => true, :noMove => true) do |image|
          # image.width=70
          # image.height=71
          # image.start_at 22, 14
          # image.end_at 1, 1
        # end
         sheet.add_row ["Weekly Test Report on #{@date} of station #{@station.name}"]
         @tests.each_slice(24).with_index do |slice, index|
           sheet.add_row ["Bank No #{ index + 1}"]
           sheet.add_row ["Cell No.", "Total Voltage", "Visual Inspection", "Reported by", "Reported date"], :style => Axlsx::STYLE_THIN_BORDER
           slice.each_with_index do |t, i|
            sheet.add_row [i+1, t.cell_voltage, t.visual_inspection,t.inserted_by, t.created_at.to_s], :style => Axlsx::STYLE_THIN_BORDER 
           end
           sheet.column_widths 10,nil, 23, 23, 23
           sheet.merge_cells("A1:D1")
         end
      end
      send_data package.to_stream.read, :filename => 'report.xlsx', :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
   end 


end
