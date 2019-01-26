require 'test_helper'

class RegistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get regists_new_url
    assert_response :success
  end

end
