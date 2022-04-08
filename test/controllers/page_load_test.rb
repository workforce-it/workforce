require "test_helper"

class SiteControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get root_path
    assert_response :success
    assert_select "span", "Workforce Management Software for Frontline Teams", count: 1
    assert_select "title", "Workforce Management Software | Workforce.com", count: 1
    assert_select 'meta[name="description"][content="The leading workforce management software for employee scheduling, time & attendance, legal compliance, and more."]', visible: false, count: 1
    assert_select 'link[rel="canonical"][href="https://workforce.com/"]', count: 1
    assert_select 'link[rel="alternate"][hreflang="en-us"][href="https://workforce.com/"]', count: 1
    assert_select 'link[rel="alternate"][hreflang="en-gb"][href="https://workforce.com/uk/"]', count: 1
  end

  test "should get index -> UK" do
    get root_path(locale: "uk")
    assert_response :success
    assert_select "span", "Workforce Management Software for Frontline Teams", count: 1
    assert_select 'meta[name="description"][content="The leading workforce management software for employee scheduling, time & attendance, legal compliance, and more."]', visible: false, count: 1
    assert_select 'link[rel="canonical"][href="https://workforce.com/uk/"]', count: 1
    assert_select 'link[rel="alternate"][hreflang="en-us"][href="https://workforce.com/"]', count: 1
    assert_select 'link[rel="alternate"][hreflang="en-gb"][href="https://workforce.com/uk/"]', count: 1
  end

  test "should get use cases" do
    get role_by_role_path
    assert_response :success
  end

  test "should get customers page" do
    get customers_path
    assert_response :success
  end

  test "should get free trial page" do
    get try_path
    assert_response :success
  end

  test "should get book demo page" do
    get book_demo_path(type: :demo)
    assert_response :success
  end

  test "should get scheduling software page" do
    get software_scheduling_software_path
    assert_response :success
  end

  test "should get attendance page" do
    get software_time_and_attendance_path
    assert_response :success
  end

  test "should get app page" do
    get software_employee_app_path
    assert_response :success
  end

  test "should get privacy page" do
    get privacy_policy_path
    assert_response :success
  end

  test "should get terms page" do
    get terms_path
    assert_response :success
    assert @response.body.include?("Chicago")
    assert_not @response.body.include?("London")
  end

  test "should get terms page in UK" do
    get terms_path(locale: "uk")
    assert_response :success
    assert_not @response.body.include?("Chicago")
    assert @response.body.include?("London")
  end

  test "should get cookies page" do
    get cookies_path
    assert_response :success
  end

  test "should get whitepapers page" do
    get whitepapers_path
    assert_response :success
  end

  test "should get security page" do
    get security_path
    assert_response :success
  end

  test "should get GDPR" do
    get gdpr_path
    assert_response :success
  end

  test "/role/:slug redirects to new roles page" do
    get "/role/clo"
    assert_redirected_to role_by_role_path
  end

  test "should get biometric page" do
    get biometric_path
    assert_response :success
  end

  test "should get communications page" do
    get software_employee_communications_path
    assert_response :success
  end

  test "should get hospitality page" do
    get industry_hospitality_path
    assert_response :success
  end

  test "should get staffing page" do
    get industry_staffing_path
    assert_response :success
  end

  test "should get integrations list" do
    get integrations_path
    assert_response :success
  end

  test "should get integration pages - UK" do
    get integrations_path(locale: "uk")
    assert_response :success

    get integrations_brightpay_path(locale: "uk")
    assert_response :success

    get integrations_xero_path(locale: "uk")
    assert_response :success

    get integrations_lightspeed_path(locale: "uk")
    assert_response :success

    get integrations_goodtill_path(locale: "uk")
    assert_response :success

    get integrations_zettle_path(locale: "uk")
    assert_response :success

    get integrations_backofhouse_path(locale: "uk")
    assert_response :success

    get integrations_twicebaked_path(locale: "uk")
    assert_response :success

    get integrations_icr_touch_path(locale: "uk")
    assert_response :success

    get integrations_tenzo_path(locale: "uk")
    assert_response :success

    get integrations_vitamojo_path(locale: "uk")
    assert_response :success
  end

  test "canonical paths for URLs that dont differ per-country" do
    get software_employee_communications_path
    assert_response :success
    assert_select 'link[rel=canonical][href="https://workforce.com/software/employee-communications"]'
    assert_select 'link[rel=alternate][hreflang=en-us][href="https://workforce.com/software/employee-communications"]'
    assert_select 'link[rel=alternate][hreflang=en-gb][href="https://workforce.com/uk/software/employee-communications"]'
    assert_select 'link[rel=alternate][hreflang=x-default][href="https://workforce.com/software/employee-communications"]'
  end

  test "scheduling URL and meta tags" do
    get "/software/scheduling-software"
    assert_response :ok
    assert_select 'link[rel=canonical][href="https://workforce.com/software/scheduling-software"]'
    assert_select 'link[rel=alternate][hreflang=en-us][href="https://workforce.com/software/scheduling-software"]'
    assert_select 'link[rel=alternate][hreflang=en-gb][href="https://workforce.com/uk/software/rota"]'
    assert_select 'link[rel=alternate][hreflang=x-default][href="https://workforce.com/software/scheduling-software"]'

    get "/software/scheduling-software"
    assert_response :ok
    assert_select 'link[rel=canonical][href="https://workforce.com/software/scheduling-software"]'
    assert_select 'link[rel=alternate][hreflang=en-us][href="https://workforce.com/software/scheduling-software"]'
    assert_select 'link[rel=alternate][hreflang=en-gb][href="https://workforce.com/uk/software/rota"]'
    assert_select 'link[rel=alternate][hreflang=x-default][href="https://workforce.com/software/scheduling-software"]'

    get "/uk/software/scheduling-software"
    assert_redirected_to "/uk/software/rota"

    get "/uk/software/rota"
    assert_response :ok
    assert_select 'link[rel=canonical][href="https://workforce.com/uk/software/rota"]'
    assert_select 'link[rel=alternate][hreflang=en-us][href="https://workforce.com/software/scheduling-software"]'
    assert_select 'link[rel=alternate][hreflang=en-gb][href="https://workforce.com/uk/software/rota"]'
    assert_select 'link[rel=alternate][hreflang=x-default][href="https://workforce.com/uk/software/rota"]'

    get "/software/rota"
    assert_redirected_to "/uk/software/rota"
  end

  test "should get how it works with no locale" do
    get how_it_works_path
    assert_response :success
    assert_select "h2", "Build smarter schedules based on demand. Instantly.", count: 1
  end

  test "should redirect to non-uk news article" do
    get "/uk/news/how-short-staffed-resorts-can-optimize-scheduling"
    assert_redirected_to "/news/how-short-staffed-resorts-can-optimize-scheduling"
  end

  test "uk news visitor should redirect to non-news uk page" do
    get "/uk/news/how-to-determine-weekly-work-hours-for-your-staff"
    assert_redirected_to "/news/how-to-determine-weekly-work-hours-for-your-staff"
    get how_it_works_path
    path = request.path 
    assert_equal "/uk/how-it-works", path
    assert_select "p", "Manage labour costs, handle compliance, and auto-build schedules based on demand.", count: 1
  end

  test "uk marketing site visitor goes to non-uk news site" do
    get root_path("uk")
    assert_response :success
    get news_path
    assert_redirected_to news_path(nil)
  end

  test "should get news page" do
    get news_path
    assert_response :success
    assert_select 'meta[name="description"][content="The latest news and commentary on workplace and employment. Find free resources on labor insights, working conditions, and people management software labor efficiency and helping your teams achieve success."]', visible: false, count: 1
    assert_select 'link[rel="canonical"][href="https://workforce.com/news"]', count: 1
    assert_select 'link[rel="alternate"][hreflang="en-us"][href="https://workforce.com/news"]', count: 1
  end
end
