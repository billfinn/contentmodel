require 'test_helper'

class TreeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tree_index_url
    assert_response :success
  end

end
