require 'test_helper'

class ProusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prousers_index_url
    assert_response :success
  end

end
