require 'test_helper'

class TuantisControllerTest < ActionController::TestCase
  setup do
    @tuanti = tuantis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuantis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tuanti" do
    assert_difference('Tuanti.count') do
      post :create, tuanti: { description: @tuanti.description, name: @tuanti.name }
    end

    assert_redirected_to tuanti_path(assigns(:tuanti))
  end

  test "should show tuanti" do
    get :show, id: @tuanti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tuanti
    assert_response :success
  end

  test "should update tuanti" do
    put :update, id: @tuanti, tuanti: { description: @tuanti.description, name: @tuanti.name }
    assert_redirected_to tuanti_path(assigns(:tuanti))
  end

  test "should destroy tuanti" do
    assert_difference('Tuanti.count', -1) do
      delete :destroy, id: @tuanti
    end

    assert_redirected_to tuantis_path
  end
end
