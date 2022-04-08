require "test_helper"

class SitemapsControllerTest < ActionDispatch::IntegrationTest
    test "should render US xml sitemap" do
        get "/sitemap.xml"
        assert_response :success
        hash = Hash.from_xml(response.parsed_body.gsub("\n", "")) 
        site_map_unit = hash["urlset"]["url"].first.first
        root_unit = ["loc", "https://workforce.com"]
        assert_equal site_map_unit,root_unit
    end

    test "should render UK xml sitemap" do
        get "/uk_sitemap.xml"
        assert_response :success
        hash = Hash.from_xml(response.parsed_body.gsub("\n", "")) 
        site_map_unit = hash["urlset"]["url"].first.first
        root_unit = ["loc", "https://workforce.com/uk"]
        assert_equal site_map_unit,root_unit
    end

    test "should render News xml sitemap" do
        get "/news_sitemap.xml"
        assert_response :success
        hash = Hash.from_xml(response.parsed_body.gsub("\n", "")) 
        site_map_unit = hash["urlset"]["url"].last.first
        news_unit = ["loc", "https://workforce.com/news/why-customer-satisfaction-starts-with-hr"]
        assert_equal site_map_unit,news_unit
    end

    test "should render index xml sitemap" do
        get "/index.xml"
        assert_response :success
        hash = Hash.from_xml(response.parsed_body.gsub("\n", "")) 
        site_map_unit = hash["sitemapindex"]["sitemap"].first.first
        index_unit = ["loc", "https://workforce.com/sitemap.xml"]
        assert_equal site_map_unit,index_unit
    end
end
