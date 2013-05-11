require 'test_helper'

class RecordVideosControllerTest < ActionController::TestCase
  setup do
    @record_video = record_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:record_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create record_video" do
    assert_difference('RecordVideo.count') do
      post :create, record_video: { counter: @record_video.counter, name: @record_video.name, source: @record_video.source, tuanti_id: @record_video.tuanti_id, youkuid: @record_video.youkuid }
    end

    assert_redirected_to record_video_path(assigns(:record_video))
  end

  test "should show record_video" do
    get :show, id: @record_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @record_video
    assert_response :success
  end

  test "should update record_video" do
    put :update, id: @record_video, record_video: { counter: @record_video.counter, name: @record_video.name, source: @record_video.source, tuanti_id: @record_video.tuanti_id, youkuid: @record_video.youkuid }
    assert_redirected_to record_video_path(assigns(:record_video))
  end

  test "should destroy record_video" do
    assert_difference('RecordVideo.count', -1) do
      delete :destroy, id: @record_video
    end

    assert_redirected_to record_videos_path
  end
end
