require 'test_helper'

class CompanyStatsControllerTest < ActionController::TestCase
  setup do
    @company_stat = company_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_stat" do
    assert_difference('CompanyStat.count') do
      post :create, company_stat: { desc: @company_stat.desc, name: @company_stat.name, stat: @company_stat.stat, type: @company_stat.type }
    end

    assert_redirected_to company_stat_path(assigns(:company_stat))
  end

  test "should show company_stat" do
    get :show, id: @company_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_stat
    assert_response :success
  end

  test "should update company_stat" do
    patch :update, id: @company_stat, company_stat: { desc: @company_stat.desc, name: @company_stat.name, stat: @company_stat.stat, type: @company_stat.type }
    assert_redirected_to company_stat_path(assigns(:company_stat))
  end

  test "should destroy company_stat" do
    assert_difference('CompanyStat.count', -1) do
      delete :destroy, id: @company_stat
    end

    assert_redirected_to company_stats_path
  end
end
