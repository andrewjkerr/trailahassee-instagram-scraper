require 'test_helper'

class ScreensaverControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screensaver_index_url
    assert_response :success
  end

  test "should get new_image" do
    get screensaver_new_image_url
    assert_response :success
  end

end
