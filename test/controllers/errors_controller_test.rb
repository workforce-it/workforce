require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should handle a missing route in a html format" do
    get "/asdf"
    assert_response :missing
    assert @response.body.include?("404 | Workforce.com")
  end

  test "should handle a missing route in a non-html format" do
    get "//wp1/wp-includes/wlwmanifest.xml", headers: { "Content-Type" => "application/xml", "Accept" => "application/xml" }
    assert_response :missing
    assert @response.body.blank?
  end
end
