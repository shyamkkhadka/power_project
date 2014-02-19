require 'test_helper'

class GeneratorsControllerTest < ActionController::TestCase
  setup do
    @generator = generators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generator" do
    assert_difference('Generator.count') do
      post :create, generator: { air_filter: @generator.air_filter, alternator_manufacturer: @generator.alternator_manufacturer, alternator_model_no: @generator.alternator_model_no, alternator_serial_no: @generator.alternator_serial_no, company_name: @generator.company_name, control_panel_height: @generator.control_panel_height, control_panel_length: @generator.control_panel_length, control_panel_width: @generator.control_panel_width, cooling_type: @generator.cooling_type, engine_manufacturer: @generator.engine_manufacturer, engine_model_no: @generator.engine_model_no, engine_oil_type: @generator.engine_oil_type, engine_serial_no: @generator.engine_serial_no, eqp_code: @generator.eqp_code, first_installation_date: @generator.first_installation_date, fuel_filter: @generator.fuel_filter, genset_height: @generator.genset_height, genset_length: @generator.genset_length, genset_weight: @generator.genset_weight, installation_team: @generator.installation_team, model_no: @generator.model_no, oil_sumo_capacity: @generator.oil_sumo_capacity, sec_fuel_filter: @generator.sec_fuel_filter, sound_level: @generator.sound_level, starter_battery_capacity: @generator.starter_battery_capacity, station_id: @generator.station_id, system_type_id: @generator.system_type_id, type: @generator.type, water_filter: @generator.water_filter }
    end

    assert_redirected_to generator_path(assigns(:generator))
  end

  test "should show generator" do
    get :show, id: @generator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generator
    assert_response :success
  end

  test "should update generator" do
    put :update, id: @generator, generator: { air_filter: @generator.air_filter, alternator_manufacturer: @generator.alternator_manufacturer, alternator_model_no: @generator.alternator_model_no, alternator_serial_no: @generator.alternator_serial_no, company_name: @generator.company_name, control_panel_height: @generator.control_panel_height, control_panel_length: @generator.control_panel_length, control_panel_width: @generator.control_panel_width, cooling_type: @generator.cooling_type, engine_manufacturer: @generator.engine_manufacturer, engine_model_no: @generator.engine_model_no, engine_oil_type: @generator.engine_oil_type, engine_serial_no: @generator.engine_serial_no, eqp_code: @generator.eqp_code, first_installation_date: @generator.first_installation_date, fuel_filter: @generator.fuel_filter, genset_height: @generator.genset_height, genset_length: @generator.genset_length, genset_weight: @generator.genset_weight, installation_team: @generator.installation_team, model_no: @generator.model_no, oil_sumo_capacity: @generator.oil_sumo_capacity, sec_fuel_filter: @generator.sec_fuel_filter, sound_level: @generator.sound_level, starter_battery_capacity: @generator.starter_battery_capacity, station_id: @generator.station_id, system_type_id: @generator.system_type_id, type: @generator.type, water_filter: @generator.water_filter }
    assert_redirected_to generator_path(assigns(:generator))
  end

  test "should destroy generator" do
    assert_difference('Generator.count', -1) do
      delete :destroy, id: @generator
    end

    assert_redirected_to generators_path
  end
end
