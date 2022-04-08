class FreeTrialController < ApplicationController

  def index
  end

  def create
    recatcha_valid = verify_recaptcha(action: "signup")
    if recaptcha_reply.nil?
    # If reCAPTCHA exits with nil, redirect to avoid error
        redirect_to try_path
    else
    # If reCAPTCHA score is low, redirect to avoid bot
    return redirect_to(try_path) if recaptcha_reply.present? && recaptcha_reply["score"].present? && recaptcha_reply["score"] <= 0.3
    
    signup_props = trial_params.to_h.merge(recatcha_valid: recatcha_valid, recaptcha_score: recaptcha_reply["score"])

  	# send to the product
    url = Rails.env.production? ? "https://my.workforce.com/api/v2/sign_up" : "https://staging.workforce.com/api/v2/sign_up"
  	response = Request::Workforce.new(signup_props).post_to_url("workforce", url)
  	if response.blank?
  		redirect_to try_path
  	else 
  		redirect_to response
  	end
  	# send to zapier which pushes to SF
  	ZapierTrialJob.perform_later(signup_props)
    end
  end

  def trial_params
  	params.permit(:authenticity_token, :email, :companyName, :companySize, :city, :region, :region_code, :country, :country_name,
  		:country_code, :continent_code, :in_eu, :postal, :latitude, :longitude, :time_zone, :country_calling_code,
  		:firstName, :lastName, :phone, :firstPage).merge(staff_api_count: staff_count).merge(utm_params).merge(true_country: true_country).merge(signup_type: signup_type).merge(pageURL: "/try")
  end

  def staff_count
  	case params[:companySize]
  	when "0-19"
      1
    when "20-49"
      20
    when "50-99"
      50
    when "100-499"
      100
    when "500-999"
      500
    when "1000-2499"
    	1000
    when "2,500-4,999"
    	2500
    when "5,000-9,999"
    	5000
    when "10,000-24,999"
      10000
    when "25,000 +"
      25000
    else
      0
    end
  end

  def utm_params
 	  utm = JSON.parse(cookies[:utm]).deep_symbolize_keys
		if utm
			utm_source = clean_utm_source
			utm_medium = utm[:utm_medium]
			utm_campaign = utm[:utm_campaign]
			utm_term = utm[:utm_term]
      first_page = utm[:first_page]
		else 
			utm_source = clean_utm_source
			utm_medium = params[:utm_medium]
			utm_campaign = "Marketing_Site_Lead"
			utm_term = params[:utm_term]
      first_page = params[:first_page]
		end
		{ utm_source: utm_source, utm_medium: utm_medium, utm_campaign: utm_campaign, utm_term: utm_term, first_page: first_page }
	end

  def clean_utm_source
    utm = JSON.parse(cookies[:utm]).deep_symbolize_keys
    utm_source = utm ? utm[:utm_source] : params[:utm_source]
    case utm_source
    when "www.google.com"
      utm_source = "google"
    when "www.workforce.com"
      utm_source = "workforce.com"
    when "www.bing.com"
      utm_source = "bing"
    when nil
      utm_source = "direct"
    end
    utm_source
  end

  def true_country
    if params[:country_name].blank?
      if params[:phone].present? && params[:phone].length > 11
        "United Kingdom"
      else
        "United States"
      end
    else
      params[:country_name]
    end
  end

  def signup_type
    if staff_count === 1 && true_country === "United States"
      "marketing_site_free_trial"
    else
      "marketing_site_free_trial"
    end
  end
end
