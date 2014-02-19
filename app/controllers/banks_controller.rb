class BanksController < ApplicationController
  # GET /banks
  # GET /banks.json
  def index
    @banks = Bank.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banks }
    end
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
    @bank = Bank.find(params[:id])

		# Prepare row data to be passed into jqgrid as json
		@row_data = Array.new
  	@bank.cells.each_with_index do |v, i| 
			cell = Hash.new
			cell[:id] = i.to_i + 1
			cell[:cell_voltage] = v
			@row_data.push(cell)
		end
		#@row_data = [{:id => 1, :cell_voltage => 12}, {:id => 2, :cell_voltage => 24}]
		
		respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @row_data }
    end
  end

  # GET /banks/new
  # GET /banks/new.json
  def new
    @bank = Bank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bank }
    end
  end

  # GET /banks/1/edit
  def edit
    @bank = Bank.find(params[:id])
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new(params[:bank])

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'Bank was successfully created.' }
        format.json { render json: @bank, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /banks/1
  # PUT /banks/1.json
  def update
    @bank = Bank.find(params[:id])

    respond_to do |format|
      if @bank.update_attributes(params[:bank])
        format.html { redirect_to @bank, notice: 'Bank was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank = Bank.find(params[:id])
    @bank.destroy

    respond_to do |format|
      format.html { redirect_to banks_url }
      format.json { head :no_content }
    end
  end

	# Custom action added for entering cell voltage from jqgrid
	# POST /batteries/1/banks/1/update_cell
  # POST /banks/1.json
  def update_cell
    @bank = Bank.find(params[:bank_id])
		cells = @bank.cells
		cells[params[:id].to_i - 1] = params[:cell_voltage].to_i
		puts "@@@@@@cells is #{cells.inspect}" 
    respond_to do |format|
      if @bank.update_attributes(:cells => cells)
        #format.html { redirect_to @bank, notice: 'Bank was successfully updated.' }
				#render :text => "saved"        
				format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

end
