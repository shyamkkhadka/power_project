require 'test_helper'

class RectifiersControllerTest < ActionController::TestCase
  setup do
    @rectifier = rectifiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rectifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rectifier" do
    assert_difference('Rectifier.count') do
      post :create, rectifier: { first_installation_date: @rectifier.first_installation_date, installation_team: @rectifier.installation_team, manufacturer_name: @rectifier.manufacturer_name, module_no: @rectifier.module_no, remarks: @rectifier.remarks, serial_no: @rectifier.serial_no, station_id: @rectifier.station_id, system_type_id: @rectifier.system_type_id, total_capacity: @rectifier.total_capacity }
    end

    assert_redirected_to rectifier_path(assigns(:rectifier))
  end

  test "should show rectifier" do
    get :show, id: @rectifier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rectifier
    assert_response :success
  end

  test "should update rectifier" do
    put :update, id: @rectifier, rectifier: { first_installation_date: @rectifier.first_installation_date, installation_team: @rectifier.installation_team, manufacturer_name: @rectifier.manufacturer_name, module_no: @rectifier.module_no, remarks: @rectifier.remarks, serial_no: @rectifier.serial_no, station_id: @rectifier.station_id, system_type_id: @rectifier.system_type_id, total_capacity: @rectifier.total_capacity }
    assert_redirected_to rectifier_path(assigns(:rectifier))
  end

  test "should destroy rectifier" do
    assert_difference('Rectifier.count', -1) do
      delete :destroy, id: @rectifier
    end

    assert_redirected_to rectifiers_path
  end
end
