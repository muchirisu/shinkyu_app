require 'test_helper'

class NewpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get newposts_index_url
    assert_response :success
  end

end
