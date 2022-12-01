require "test_helper"

class NasaPictureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nasa_picture_index_url
    assert_response :success
  end
end
