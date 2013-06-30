require 'test_helper'

class BatteryDailyTestsControllerTest < ActionController::TestCase
  setup do
    @battery_daily_test = battery_daily_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battery_daily_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battery_daily_test" do
    assert_difference('BatteryDailyTest.count') do
      post :create, battery_daily_test: { battery_id: @battery_daily_test.battery_id, total_voltage: @battery_daily_test.total_voltage, visual_inspection: @battery_daily_test.visual_inspection }
    end

    assert_redirected_to battery_daily_test_path(assigns(:battery_daily_test))
  end

  test "should show battery_daily_test" do
    get :show, id: @battery_daily_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battery_daily_test
    assert_response :success
  end

  test "should update battery_daily_test" do
    put :update, id: @battery_daily_test, battery_daily_test: { battery_id: @battery_daily_test.battery_id, total_voltage: @battery_daily_test.total_voltage, visual_inspection: @battery_daily_test.visual_inspection }
    assert_redirected_to battery_daily_test_path(assigns(:battery_daily_test))
  end

  test "should destroy battery_daily_test" do
    assert_difference('BatteryDailyTest.count', -1) do
      delete :destroy, id: @battery_daily_test
    end

    assert_redirected_to battery_daily_tests_path
  end
end
