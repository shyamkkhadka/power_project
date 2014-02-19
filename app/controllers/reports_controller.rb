class ReportsController < ApplicationController

  # GET /Reports
  # GET /reports.json
  def index
    # @reports = Report.all
    # respond_to do |format|
      # format.html # index.html.erb
      # format.json { render json: @reports }
    # end
  end

  # # GET /reports/1
  # # GET /reports/1.json
  # def show
    # @report = Report.find(params[:id])
# 
    # respond_to do |format|
      # format.html # show.html.erb
      # format.json { render json: @report }
    # end
  # end
# 
  # # GET /reports/new
  # # GET /reports/new.json
  # def new
    # @station = Station.find(params[:station_id])
    # @report = Report.new
#     
    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @report }
    # end
  # end
# 
  # # GET /reports/1/edit
  # def edit
    # @report = Report.find(params[:id])
    # @station = Station.find(params[:station_id])
# 
    # # Display users list for installation team
    # installation_team = @report.installation_team.split(",")
    # @users = User.find(:all, :conditions => {:id => installation_team}, :select => 'name_emp_id, id').to_json.html_safe
  # end
# 
  # # TODO: ADD equipment_code to map between equipment table and report
  # # POST /reports
  # # POST /reports.json
  # def create
    # @report = Report.new(params[:report])
    # @station = Station.find(params[:station_id])
# 
    # # Find system type id from system name
    # @report.system_type_id = SystemType.find_by_name(params[:report][:system_type_id]).id
#     
    # respond_to do |format|
      # if @report.save
        # # Create empty bank records for report according to given number of banks attributes     
        # create_banks(@report)
        # format.html { redirect_to station_reports_path(@report.station), notice: 'Report was successfully created.' }
        # format.json { render json: @report, status: :created, location: @report }
      # else
        # format.html { render action: "new" }
        # format.json { render json: @report.errors, status: :unprocessable_entity }
      # end
    # end
  # end
# 
  # # PUT /reports/1
  # # PUT /reports/1.json
  # def update
    # @report = Report.find(params[:id])
    # params[:report][:system_type_id] = SystemType.find_by_name(params[:report][:system_type_id]).id
#     
    # respond_to do |format|
      # if @report.update_attributes(params[:report])
        # format.html { redirect_to station_reports_path(@report.station), notice: 'Report was successfully updated.' }
        # format.json { head :no_content }
      # else
        # format.html { render action: "edit" }
        # format.json { render json: @report.errors, status: :unprocessable_entity }
      # end
    # end
  # end
# 
  # # DELETE /reports/1
  # # DELETE /reports/1.json
  # def destroy
    # @report = Report.find(params[:id])
    # @report.destroy
# 
    # respond_to do |format|
      # format.html { redirect_to station_reports_url }
      # format.json { head :no_content }
    # end
  # end
# 
  # # Create empty bank records for report according to given number of banks attributes     
  # def create_banks(report)
      # report.bank_no.times do 
        # a = Bank.create(:battery_id => report.id, :cells => [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])
      # report.banks.push(a)
    # end
  # end

end
