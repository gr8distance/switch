require 'test_helper'

class PrefetchesControllerTest < ActionController::TestCase
  setup do
    @prefetch = prefetches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prefetches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prefetch" do
    assert_difference('Prefetch.count') do
      post :create, prefetch: { types: @prefetch.types }
    end

    assert_redirected_to prefetch_path(assigns(:prefetch))
  end

  test "should show prefetch" do
    get :show, id: @prefetch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prefetch
    assert_response :success
  end

  test "should update prefetch" do
    patch :update, id: @prefetch, prefetch: { types: @prefetch.types }
    assert_redirected_to prefetch_path(assigns(:prefetch))
  end

  test "should destroy prefetch" do
    assert_difference('Prefetch.count', -1) do
      delete :destroy, id: @prefetch
    end

    assert_redirected_to prefetches_path
  end
end
