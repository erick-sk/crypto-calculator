require "test_helper"

class ProjectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get projections_show_url
    assert_response :success
  end
end
