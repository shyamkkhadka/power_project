require 'test_helper'

class BatteryWeeklyTestsControllerTest < ActionController::TestCase
  setup do
    @battery_weekly_test = battery_weekly_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battery_weekly_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battery_weekly_test" do
    assert_difference('BatteryWeeklyTest.count') do
      post :create, battery_weekly_test: { battery_id: @battery_weekly_test.battery_id, cell_voltage: @battery_weekly_test.cell_voltage }
    end

    assert_redirected_to battery_weekly_test_path(assigns(:battery_weekly_test))
  end

  test "should show battery_weekly_test" do
    get :show, id: @battery_weekly_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battery_weekly_test
    assert_response :success
  end

  test "should update battery_weekly_test" do
    put :update, id: @battery_weekly_test, battery_weekly_test: { battery_id: @battery_weekly_test.battery_id, cell_voltage: @battery_weekly_test.cell_voltage }
    assert_redirected_to battery_weekly_test_path(assigns(:battery_weekly_test))
  end

  test "should destroy battery_weekly_test" do
    assert_difference('BatteryWeeklyTest.count', -1) do
      delete :destroy, id: @battery_weekly_test
    end

    assert_redirected_to battery_weekly_tests_path
  end
end
