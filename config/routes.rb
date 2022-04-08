Rails.application.routes.draw do

  scope "(:locale)", :locale => /uk/ do
    root to: "site#index"

    get "how-it-works", to: "site#how_it_works"
    get "role-by-role", to: "site#role_by_role"
    get "why-were-different", to: "site#why_different"
    get "customers", to: "site#customers"

    get "pricing", to: "site#pricing"
    get "contact-us", to: "site#contact"
    get "integrations", to: "integrations#index"

    get "try", to: "free_trial#index"
    post "try", to: "free_trial#create"

  	get "book_demo", to: "book_demo#index"
  	post "book_demo", to: "book_demo#create"

    get "poa", to: "poa#index"
    post "poa", to: "poa#create"

    get "/software/scheduling-software", to: "site#scheduling"
    get "/software/time-and-attendance", to: "site#attendance"
    get "/software/employee-app", to: "site#employee_app"
    get "/software/timeclock-app", to: "site#timeclock_app"
    get "/software/auto-scheduling", to: "site#auto_scheduling"
    get "/software/employee-onboarding", to: "site#employee_onboarding"
    get "/software/wage-and-hour-compliance", to: "site#compliance"
    get "/software/payroll-integration", to: "site#payroll"
    get "/software/employee-communications", to: "site#communications"

    get "/integrations/workday", to: "integrations#workday"

    get "/integrations/brightpay", to: "integrations#brightpay"
    get "/integrations/xero", to: "integrations#xero"
    get "/integrations/lightspeed", to: "integrations#lightspeed"
    get "/integrations/goodtill", to: "integrations#goodtill"
    get "/integrations/zettle", to: "integrations#zettle"
    get "/integrations/backofhouse", to: "integrations#back_of_house"
    get "/integrations/twicebaked", to: "integrations#twice_baked"
    get "/integrations/icr-touch", to: "integrations#icr_touch"
    get "/integrations/tenzo", to: "integrations#tenzo"
    get "/integrations/vitamojo", to: "integrations#vitamojo"

    get "/software/rota", to: "site#scheduling"

    get "/industry/hospitality", to: "site#hospitality"
    get "/industry/staffing", to: "site#staffing"

    # newly designed and relatively personalized
    get "/industry/restaurant-and-bars", to: "site#restaurants_and_bars"
    get "/industry/hospitals", to: "site#hospitals"
    get "/industry/call-centers", to: "site#call_centers"
    get "/industry/construction", to: "site#construction"
    get "/industry/elderly-care", to: "site#elder_care"
    get "/industry/healthcare", to: "site#healthcare"

    # all the same content bar the header
    get "/industry/hotels", to: "site#hotels"
    get "/industry/manufacturing", to: "site#manufacturing"
    get "/industry/retail", to: "site#retail"
    get "/industry/franchise", to: "site#franchise"

    get "/news", to: "news#index"
    get "/news/:slug", to: "news#article", as: "news_article"
    get "/whitepapers", to: "news#whitepapers"

    get "/privacy-policy", to: "site#privacy_policy"
    get "/terms", to: "site#terms"
    get "/cookies", to: "site#cookies_page"
    get "/security", to: "site#security"
    get "/biometric", to: "site#biometric"
    get "/gdpr", to: "site#gdpr"

    # old site redirects
    # (someone made a different url structure when redesigning pages,
    #  so there are duplicate urls that rank differently, which we have to maintain)
    get "industry/call-center/scheduling", to: "site#call_centers"
    get "industry/call-center/workforce-management", to: "site#call_centers"
    get "industry/hospitals/scheduling", to: "site#hospitals"
    get "industry/restaurant-and-dining", to: "site#restaurants_and_bars"
    get "industry/construction/scheduling", to: "site#construction"
    get "industry/elderly-care/scheduling", to: "site#elder_care"

    # the current page says pharmacy but is about medical practices. redirecting all for now.
    get "/industry/pharmacy" => redirect("/industry/healthcare")
    get "/industry/medical-and-pharmacy" => redirect("/industry/healthcare")

    get "/role/*slug" => redirect("/role-by-role")

    get "/software/labor-compliance" => redirect("/software/wage-and-hour-compliance")

    # these feature pages were deemed unimportant for SEO, so we don't need them immediately
    get "/software/leave-and-unavailability" => redirect("/how-it-works")
    get "/software/livewage-tracker" => redirect("/how-it-works")
    get "/software/shift-feedback" => redirect("/how-it-works")
    get "/software/shift-swapping" => redirect("/how-it-works")
    get "/software/chat" => redirect("/how-it-works")

    # Broken Link Redirect Fixs
    get 'eu/privacy-policy'=> redirect('uk/privacy-policy')
    get 'software/workforce-analytics' => redirect('/how-it-works')
    get 'software/labor-compliance' => redirect('/time-and-attendance')
    get 'tools/scheduling-template' => redirect('/scheduling-software')
    get '/uk/software/gps-clock-ins' => redirect('/how-it-works')
    get 'software/gps-clock-ins' => redirect('/how-it-works')
    get 'software' => redirect('/how-it-works')
    get 'subscribe' => redirect('/')

    get '/files/WORK03-Representative-contact-summary-2021.pdf' => redirect('/whitepapers')
    get '/uk/coookies' => redirect('/uk/cookies')
    get '/2016/12/08/scheduling-reform-pushes-way-retail-industry/' => redirect('/news')
    get '/2017/01/12/branding-building-relationships-and-getting-social/' => redirect('/news')
    get '/2017/01/17/workplace-legacy-barack-obama/' => redirect('/news')
    get '/2018/01/22/recruiting-tech-expanding-unlike-recruiters-willingness-use/' => redirect('/news')
    get '/2018/06/15/artificial-in...utomation-and-the-future-of-talent-acquisition/' => redirect('/news')
    get '/2018/08/14/protecting-yo...eing-omarosad-workplace-recordings-and-the-law/' => redirect('/news')
    get '/2018/08/21/workplace-mon...ng-corporate-privacy-versus-individual-privacy/' => redirect('/news')
    get '/2018/09/26/dont-ignore-state-law-when-considering-wage-and-hour-issues/' => redirect('/news')
    get '/2018/10/03/predictable-shift-laws-spread-more-cities-states/' => redirect('/news')
    get '/2018/11/09/meet-new-colleague-artificial-intelligence/' => redirect('/news')
    get '/2018/12/12/hot-topics-for-2019-metoo-and-data-privacy/' => redirect('/news')
    get '/2019/08/07/the-ethics-of-artificial-intelligence-in-the-workplace/' => redirect('/news')
    get '/2019/11/06/human-capital-disclosure-may-soon-be-mandated-by-the-sec/' => redirect('/news')
    get '/files/WORK03-Representative-contact-summary-2021.pdf' => redirect('/whitepapers')
    get '/news/give-managers-the-t...they-need-to-sharpen-up-their-all-around-skills' => redirect('/news')
    get '/scheduling-software' => redirect('/software/scheduling-software')
    #DELETE AFTER VIDEOS PAGE ADDED
    get '/videos/armen-berjikly-na...communication-advances-artificial-intelligence/' => redirect('/news')
    get '/videos/watch/great-workforce-management-starts-here-id=0yt=0' => redirect('/news')
    get '/videos/watch/this-is-workforcecom-id=3yt=0' => redirect('/news')
    get '/videos/watch/two-week-implementation--workforcecom-id=4yt=0' => redirect('/news')
    
  end

  # sitemaps available from public folder at
  # /sitemap.xml
  # /uk_sitemap.xml
  # /news_sitemap.xml

  #Error Pages
  match("*path", via: :all, to: "errors#not_found")
  get("/404" => "errors#not_found")
end
