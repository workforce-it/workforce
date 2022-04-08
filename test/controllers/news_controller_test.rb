require "test_helper"

class NewsControllerTest < ActionDispatch::IntegrationTest

    test "Get a news article with no author section" do
        get news_article_path(slug: "/how-to-remove-the-stress-from-shift-trade-planning")
        assert_response :success
        assert_template "news/article"
        assert_select "h1", "How to remove the stress from shift trade planning"
        assert_select "p", "By Dan Whitehead"
        assert_nil  assigns(:author_img)
    end

    test "Get a news article with an author section" do
        get news_article_path(slug: "/post-pandemic-talent")
        assert_response :success
        assert_template "news/article"
        assert_select "h1", "Casinos scramble for post-pandemic talent as business rebounds"
        assert_select "p", "By Rick Bell"
        assert_not_nil  assigns(:author_img)
        assert_not_nil  assigns(:author_info)
    end

end