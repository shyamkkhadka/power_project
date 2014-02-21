class AccountingOfficesController < ApplicationController
  # GET /accounting_offices
  # GET /accounting_offices.json
  def index
    
		# Reqeust is for listing acc_offices under selected Regional Directorate(RD)
		if params[:from] && params[:reg_directorate] != 'ALL'
			@accounting_offices = RegionalDirectorate.find(params[:reg_directorate]).accounting_offices 
		else
			@accounting_offices =  AccountingOffice.all
		end

		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounting_offices }
    end
  end

  # GET /accounting_offices/1
  # GET /accounting_offices/1.json
  def show
    @accounting_office = AccountingOffice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounting_office }
    end
  end

  # GET /accounting_offices/new
  # GET /accounting_offices/new.json
  def new
    @accounting_office = AccountingOffice.new
    @regional_directorates = RegionalDirectorate.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accounting_office }
    end
  end

  # GET /accounting_offices/1/edit
  def edit
    @accounting_office = AccountingOffice.find(params[:id])
    @regional_directorates = RegionalDirectorate.all

  end

  # POST /accounting_offices
  # POST /accounting_offices.json
  def create
    @accounting_office = AccountingOffice.new(params[:accounting_office])

    #@accounting_office.regional_directorate_id = RegionalDirectorate.find_by_code(params[:accounting_office][:regional_directorate_id]).id

    respond_to do |format|
      if @accounting_office.save
        format.html { redirect_to @accounting_office, notice: 'Accounting office was successfully created.' }
        format.json { render json: @accounting_office, status: :created, location: @accounting_office }
      else
        format.html { render action: "new" }
        format.json { render json: @accounting_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounting_offices/1
  # PUT /accounting_offices/1.json
  def update
    @accounting_office = AccountingOffice.find(params[:id])

    respond_to do |format|
      if @accounting_office.update_attributes(params[:accounting_office])
        format.html { redirect_to @accounting_office, notice: 'Accounting office was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accounting_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_offices/1
  # DELETE /accounting_offices/1.json
  def destroy
    @accounting_office = AccountingOffice.find(params[:id])
    @accounting_office.destroy

    respond_to do |format|
      format.html { redirect_to accounting_offices_url }
      format.json { head :no_content }
    end
  end
end
