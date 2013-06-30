require 'test_helper'

class AccountingOfficesControllerTest < ActionController::TestCase
  setup do
    @accounting_office = accounting_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_office" do
    assert_difference('AccountingOffice.count') do
      post :create, accounting_office: { name: @accounting_office.name, regional_directorate_id: @accounting_office.regional_directorate_id }
    end

    assert_redirected_to accounting_office_path(assigns(:accounting_office))
  end

  test "should show accounting_office" do
    get :show, id: @accounting_office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_office
    assert_response :success
  end

  test "should update accounting_office" do
    put :update, id: @accounting_office, accounting_office: { name: @accounting_office.name, regional_directorate_id: @accounting_office.regional_directorate_id }
    assert_redirected_to accounting_office_path(assigns(:accounting_office))
  end

  test "should destroy accounting_office" do
    assert_difference('AccountingOffice.count', -1) do
      delete :destroy, id: @accounting_office
    end

    assert_redirected_to accounting_offices_path
  end
end
