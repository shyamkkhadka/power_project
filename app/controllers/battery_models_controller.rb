class BatteryModelsController < ApplicationController
  # GET /battery_models
  # GET /battery_models.json
  def index
    @battery_models = BatteryModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @battery_models }
    end
  end

  # GET /battery_models/1
  # GET /battery_models/1.json
  def show
    @battery_model = BatteryModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @battery_model }
    end
  end

  # GET /battery_models/new
  # GET /battery_models/new.json
  def new
    @battery_model = BatteryModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @battery_model }
    end
  end

  # GET /battery_models/1/edit
  def edit
    @battery_model = BatteryModel.find(params[:id])
  end

  # POST /battery_models
  # POST /battery_models.json
  def create
    @battery_model = BatteryModel.new(params[:battery_model])

    respond_to do |format|
      if @battery_model.save
        format.html { redirect_to @battery_model, notice: 'Battery model was successfully created.' }
        format.json { render json: @battery_model, status: :created, location: @battery_model }
      else
        format.html { render action: "new" }
        format.json { render json: @battery_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /battery_models/1
  # PUT /battery_models/1.json
  def update
    @battery_model = BatteryModel.find(params[:id])

    respond_to do |format|
      if @battery_model.update_attributes(params[:battery_model])
        format.html { redirect_to battery_models_path, notice: 'Battery model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @battery_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battery_models/1
  # DELETE /battery_models/1.json
  def destroy
    @battery_model = BatteryModel.find(params[:id])
    @battery_model.destroy

    respond_to do |format|
      format.html { redirect_to battery_models_url }
      format.json { head :no_content }
    end
  end
end
