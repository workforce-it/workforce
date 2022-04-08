# frozen_string_literal: true

module Request
  class Workforce < Request::Base
    def call_operation(url)
      HTTParty.post(url, body: params)
    end

    def params
      {
        'name': "#{resource[:firstName]} #{resource[:lastName]}",
        'email': resource[:email],
        'phone': resource[:phone],
        'country_code': resource[:country_code],
        'business_name': resource[:companyName],
        'time_zone': resource[:time_zone],
        'scope': 'me',
        'password': SecureRandom.uuid,
        'signup_type': 'marketing_site_free_trial',
        'staff_count': resource[:staff_api_count],
        'utm_medium': resource[:utm_medium].blank? ? 'unknown' : resource[:utm_medium],
        'utm_source': resource[:utm_source].blank? ? 'unknown' : resource[:utm_source],
        'track_lead_page': resource[:first_page].blank? ? 'unknown' : resource[:first_page]
      }
    end
  end
end

