class NewsController < ApplicationController
  before_action :redirect_uk

  def index
    @most_recent = cache("5_recent_posts", expires_in: 1.hour) do
      HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/posts?per_page=5&categories_exclude=6&_embed").parsed_response.first(5)
    end
    @hero = @most_recent.shift

    @commentaries = cache("3_recent_commentaries", expires_in: 1.hour) do
      HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/posts?per_page=3&categories=6&_embed").parsed_response.first(2)
    end

    if !params[:page].blank? 
      @page = params[:page].to_i
    else
      @page = 1
    end
    @page == 1 ? @hero_section = true : @hero_section = false

    @unfiltered = cache("other_posts_#{@page}", expires_in: 1.hour) do
      HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/posts?per_page=14&categories_exclude=6&status=publish&page=#{@page}&_embed").parsed_response
    end

    sidebar_resources
  end

  def article
    slug = params[:slug]
    @post = cache("post.#{slug}.v2", expires_in: 1.hour) { HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/posts?slug=#{params[:slug]}&_embed").parsed_response.first }
    return redirect_to(news_path) if @post.nil? || !@post.key?("_embedded")
    
    @post_content = @post["content"]["rendered"]

    if !@post["categories"][0].blank?
      @related_posts = cache("3_posts_for_#{slug}.v2", expires_in: 1.hour) do
        HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/posts?categories=#{@post["categories"][0]}&exclude=#{@post["id"]}&per_page=3&_embed").parsed_response
      end
    else
      @related_posts = cache("3_posts.v2", expires_in: 1.hour) { HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/posts?per_page=3&_embed").parsed_response }
    end

    @article_info = cache("post.#{slug}.v2", expires_in: 1.hour) { HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/article_author?slug=#{@post["author"]}&_embed").parsed_response.first }

    if @article_info["_embedded"]["wp:term"][2].present?
      @author_info = cache("author_info.#{@article_info["_embedded"]["wp:term"][2][0]["id"]}}", expires_in: 3.hours) do
        HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/article_author/#{@article_info["_embedded"]["wp:term"][2][0]["id"]}").parsed_response
      end

      if @author_info["acf"].present?
        @author_img_url = cache("author_image.#{@author_info["acf"]["author_image"]}", expires_in: 3.hours) { HTTParty.get("https://admin.workforce.com/wp-json/wp/v2/media/#{@author_info["acf"]["author_image"]}?_embed").parsed_response}
        @author_img = @author_img_url["source_url"]
      end
    end
    
    sidebar_resources

  rescue URI::InvalidURIError
    redirect_to news_path
  end
  
  def whitepapers
    pdf_root = "https://wfmwhitepapers.s3.us-east-2.amazonaws.com/"

    @whitepapers = [
      {
        title: "Modern Workforce Management Strategy",
        file_path: pdf_root + "Modern_Workforce_Management.pdf",
        image_path: "modern.png",
        description: "Discover the different areas and trends of modern workforce management and how companies can leverage them.",
        type: :ebook
      },
      {
        title: "Boost Your Employee Engagement Strategy",
        description: "Organizations with high levels of employee engagement achieve better retention and higher profitability.",
        file_path: pdf_root + "Employee_Engagement.pdf",
        image_path: "boost.png",
        type: :ebook
      },
      {
        title: "The Practical Guide to Time & Attendance",
        description: "Inefficient time and attendance management can spiral into numerous workforce management problems such as labor law violations, inaccurate pay, and disengaged employees.",
        file_path: pdf_root + "Time_and_attendance.pdf",
        image_path: "time.png",
        type: :ebook
      },
      {
        title: "A Complete Guide to Employee Scheduling",
        description: "The days of manually scheduling and tracking employees’ time and attendance are numbered. Today's automated scheduling solutions can save companies time and money.",
        file_path: pdf_root + "The_Complete_Guide_to_Employee_Scheduling.pdf",
        image_path: "guideToScheduling.png",
        type: :ebook
      },
      {
        title: "Wage & Hour Compliance Strategy",
        description: "Companies big and small grapple with different compliance challenges, from keeping up with changing regulations to making sure that those are applied in their policies and processes.",
        file_path: pdf_root + "Wage_and_Hour_Compliance_Strategy.pdf",
        image_path: "compliance.png",
        type: :ebook
      },
      {
        title: "Complete Guide To Workforce Analytics",
        description: "Data analytics in the workplace is only as powerful as how it is utilized, so where do companies begin? It starts with the organized and clean data, data literacy, and leadership buy-in.",
        file_path: pdf_root + "Complete_Guide_to_Workforce_Analytics.pdf",
        image_path: "analytics.png",
        type: :ebook
      },
      {
        title: "Top 5 WFM Trends of 2021",
        description: "We’ve compiled a list of the top 5 and relevant workforce.com technology features we predict will make for key trends this year.",
        file_path: pdf_root + "Top5_WFM_Trends_of_2021.pdf",
        image_path: "top5.png",
        type: :ebook
      },
      {
        title: "The Future of Automated Employee Scheduling",
        description: "An introduction to shift algorithms, demand prediction, shift building and shift filling.",
        file_path: pdf_root + "Future_of_Automated_Employee_Scheduling.pdf",
        image_path: "automated.png",
        type: :ebook
      },
      {
        title: "Moving From a Legacy System To Save $100,000",
        description: "Business tools only begin to return benefits when they are implemented quickly and adopted fully across the company.",
        file_path: pdf_root + "Moving_from_a_Legacy_WFM_system.pdf",
        image_path: "moving.png",
        type: :ebook
      },
      {
        title: "Compliance in a Heavily Regulated Industry",
        description: "Using Workforce.com to onboard, schedule and record attendance in order to reduce administrative burden and allocate resources effectively.",
        file_path: pdf_root + "Increasing_team_efficiency_by_300.pdf",
        image_path: "increasing.png",
        type: :ebook
      },
      {
        title: "Operational Excellence With Smaller Teams",
        description: "Companies are now working with smaller teams that must maintain maximum productivity under conditions that are personally, professionally and financially challenging.",
        file_path: pdf_root + "How_to_achieve_operational_excellence_with_a_smaller_team_than_before.pdf",
        image_path: "operational.png",
        type: :ebook
      },
      {
        title: "Schedule Equilibrium",
        description: "Oorganizations are adopting a concept called schedule equilibrium, an employee-focused way to score workforce management from an employee’s perspective.",
        file_path: pdf_root + "Schedule_equilibrium.pdf",
        image_path: "scheduleEQ.png",
        type: :ebook
      },
      {
        title: "WFM Trends for Hourly Workers",
        description: "We asked HR leaders for their opinions on the latest workforce management trends.",
        file_path: pdf_root + "Trends_for_hourlyworkers.pdf",
        image_path: "hourlytrends.png",
        type: :ebook
      },
      {
        title: "Modernizing Performance Evaluation",
        description: "How improving alignment, soliciting feedback, and deploying technology can revitalize the annual performance review.",
        file_path: pdf_root + "Modern_performance_evaluation.pdf",
        image_path: "modernizing.png",
        type: :ebook
      },
      {
        title: "Compensation Complexities",
        description: "How to navigate the impact of compensation regulations of a geographically diversified workforce.",
        file_path: pdf_root + "Compensation_complexities.pdf",
        image_path: "compensation.png",
        type: :whitepaper
      },
      {
        title: "Sustaining a Workplace During a Pandemic",
        description: "Maintaining a composed and pragmatic outlook and following some basic guidelines will be a road map to organizational success in difficult times.",
        file_path: pdf_root + "Sustaining_a_workplace_during_the_covid19_outbreak.pdf",
        image_path: "covid19.png",
        type: :whitepaper
      }
    ]

  end

  private

  def redirect_uk
    # We want to redirect existing links to /uk/news to /news for SEO
    # TODO create helper method for uk specific news articles to override redirect
    if request.fullpath.include?("uk")
      if params[:slug]
        redirect_to news_article_path(nil, params[:slug]), status: 301
      else 
        redirect_to news_path(nil), status: 301
      end
    end
  end

  def sidebar_resources
    @events = cache("events") { HTTParty.get("https://admin.workforce.com/wp-json/tribe/events/v1/events").parsed_response["events"].first(3) }

    @videos = [
                {title:"This is Workforce.com", content:"Hi, My name is Meg and this is my introduction to Workforce.com", embed:"monRhsgJ5lw"},
                {title:"Case Study: COVIDCheck Colorado", content:"Find out how Workforce.com powered vaccine sites with demand driven scheduling and attendance.", embed:"IRIljuMOR94"}
              ]
  end

  def cache(key, expires_in: nil, &block)
    Rails.cache.fetch("NewsController.#{key}", expires_in: expires_in, &block)
  end
end
