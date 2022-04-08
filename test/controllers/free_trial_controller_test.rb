require 'test_helper'

class FreeTrialControllerTest < ActionDispatch::IntegrationTest

    test "should get free trial page" do
        get try_path
        assert_response :success
    end
end