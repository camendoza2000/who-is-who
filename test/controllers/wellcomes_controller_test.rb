require 'test_helper'

class WellcomesControllerTest < ActionController::TestCase
  setup do
    @wellcome = wellcomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wellcomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wellcome" do
    assert_difference('Wellcome.count') do
      post :create, wellcome: {  }
    end

    assert_redirected_to wellcome_path(assigns(:wellcome))
  end

  test "should show wellcome" do
    get :show, id: @wellcome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wellcome
    assert_response :success
  end

  test "should update wellcome" do
    patch :update, id: @wellcome, wellcome: {  }
    assert_redirected_to wellcome_path(assigns(:wellcome))
  end

  test "should destroy wellcome" do
    assert_difference('Wellcome.count', -1) do
      delete :destroy, id: @wellcome
    end

    assert_redirected_to wellcomes_path
  end
end
