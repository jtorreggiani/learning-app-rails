require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_match "Learning App Rails", response.body
    assert_response :success
  end
end
