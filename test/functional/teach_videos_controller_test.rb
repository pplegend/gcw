require 'test_helper'

class TeachVideosControllerTest < ActionController::TestCase
  setup do
    @teach_video = teach_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teach_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teach_video" do
    assert_difference('TeachVideo.count') do
      post :create, teach_video: { counter: @teach_video.counter, download_link: @teach_video.download_link, group: @teach_video.group, name: @teach_video.name, source: @teach_video.source, youkuid: @teach_video.youkuid }
    end

    assert_redirected_to teach_video_path(assigns(:teach_video))
  end

  test "should show teach_video" do
    get :show, id: @teach_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teach_video
    assert_response :success
  end

  test "should update teach_video" do
    put :update, id: @teach_video, teach_video: { counter: @teach_video.counter, download_link: @teach_video.download_link, group: @teach_video.group, name: @teach_video.name, source: @teach_video.source, youkuid: @teach_video.youkuid }
    assert_redirected_to teach_video_path(assigns(:teach_video))
  end

  test "should destroy teach_video" do
    assert_difference('TeachVideo.count', -1) do
      delete :destroy, id: @teach_video
    end

    assert_redirected_to teach_videos_path
  end
end
