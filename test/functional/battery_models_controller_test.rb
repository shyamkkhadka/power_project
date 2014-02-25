require 'test_helper'

class BatteryModelsControllerTest < ActionController::TestCase
  setup do
    @battery_model = battery_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battery_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battery_model" do
    assert_difference('BatteryModel.count') do
      post :create, battery_model: { batt_rack_height: @battery_model.batt_rack_height, batt_rack_length: @battery_model.batt_rack_length, batt_rack_weight: @battery_model.batt_rack_weight, batt_rack_width: @battery_model.batt_rack_width, capacity: @battery_model.capacity, cell_height: @battery_model.cell_height, cell_length: @battery_model.cell_length, cell_width: @battery_model.cell_width, manufacturer_name: @battery_model.manufacturer_name, name: @battery_model.name }
    end

    assert_redirected_to battery_model_path(assigns(:battery_model))
  end

  test "should show battery_model" do
    get :show, id: @battery_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battery_model
    assert_response :success
  end

  test "should update battery_model" do
    put :update, id: @battery_model, battery_model: { batt_rack_height: @battery_model.batt_rack_height, batt_rack_length: @battery_model.batt_rack_length, batt_rack_weight: @battery_model.batt_rack_weight, batt_rack_width: @battery_model.batt_rack_width, capacity: @battery_model.capacity, cell_height: @battery_model.cell_height, cell_length: @battery_model.cell_length, cell_width: @battery_model.cell_width, manufacturer_name: @battery_model.manufacturer_name, name: @battery_model.name }
    assert_redirected_to battery_model_path(assigns(:battery_model))
  end

  test "should destroy battery_model" do
    assert_difference('BatteryModel.count', -1) do
      delete :destroy, id: @battery_model
    end

    assert_redirected_to battery_models_path
  end
end
