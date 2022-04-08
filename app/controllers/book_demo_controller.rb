include Request

class BookDemoController < ApplicationController

  def index
  end

  def create
    recaptcha_valid = verify_recaptcha(action: "submit")
    if recaptcha_reply.nil?
      # If reCAPTCHA exits with nil, redirect to avoid error
        redirect_to root_path
    else
      # If reCAPTCHA score is low, redirect to avoid bot
      return redirect_to(try_path) if recaptcha_reply.present? && recaptcha_reply["score"].present? && recaptcha_reply["score"] <= 0.3

      demo_props = demo_params.to_h.merge(recaptcha_valid: recaptcha_valid, recaptcha_score: recaptcha_reply["score"])
    # send to the chill to get booking form
    response = Request::Chilli.new(demo_props).post_to_url("chilli", "https://api.chilipiper.com/marketing/workforce")
    
    if !response.blank?
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(:"book_demo", partial: "book_demo/booking_iframe", locals: { iframe: response }),
          ]
        end
      end
    else
      #if chillipiper fails, have them do the blank form fully
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(:"book_demo", partial: "book_demo/booking_iframe", locals: { iframe: "https://workforce.na.chilipiper.com/router/#{chili_region.downcase}_marketing_booking?utm_source=workforce&utm_medium=direct&utm_campaign=network_error_chiliform&utm_content=backup_button&utm_term=book_a_call" }),
          ]
        end
      end
    end
    end

  	# send to zapier
  	ChilliDemoJob.perform_later(demo_params.to_h)
  end

  def demo_params
  	params.permit(:authenticity_token, :email, :companyName, :companySize, :city, :region, :region_code, :country, :country_name,
  		:country_code, :continent_code, :in_eu, :postal, :latitude, :longitude, :time_zone, :country_calling_code,
  		:firstName, :lastName, :phone, :locale).merge(utm_params).merge(signup_type: "Online Demo Booking").merge(pageURL: request.url).merge(chili_region: chili_region)
  end

  # needed for routing as UK region comes through as "GB" from phone validation
  def chili_region
    if params[:country] == "US" || params[:country] == "CA"
      "US"
    else 
      "UK"
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
			utm_campaign = "Chilipiper_Demo_Booking"
			utm_term = params[:utm_term]
      first_page = "/try"
		end
		{ utm_source: utm_source, utm_medium: utm_medium, utm_campaign: utm_campaign, utm_term: utm_term, first_page: first_page }
	end

  def clean_utm_source
    utm = JSON.parse(cookies[:utm]).deep_symbolize_keys
    utm_source = utm ? utm[:utm_source] : params[:utm_source]
    case utm_source
    when "www.google.com"
      "google"
    when "www.workforce.com"
      "workforce.com"
    when "www.bing.com"
      "bing"
    end
  end
end
