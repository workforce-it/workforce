class ApplicationController < ActionController::Base
	before_action :capture_utm, :capture_locale
	skip_after_action :intercom_rails_auto_include

	def capture_locale
		unless cookies[:locale]
			cookies[:locale] = { value: params[:locale], expires: 1.hour}
		end
		
		if cookies[:locale] == "uk" && request.path.exclude?("/news")
			redirect_to root_path("uk") if params[:locale].blank?
		end
	end

	private

	def capture_utm
		unless cookies[:utm]
	  		cookies[:utm] = { value: utm.to_json, max_age: "2592000" }
		end
	end

	def utm
		{
			utm_source: params[:utm_source],
			utm_campaign: params[:utm_campaign],
			utm_medium: params[:utm_medium],
			utm_term: params[:utm_term],
			utm_content: params[:utm_content],
			first_page: request.path
		}
	end
end
