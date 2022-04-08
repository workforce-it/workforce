# frozen_string_literal: true

module Request
  class Poa < Request::Base
    def call_operation(url)
      HTTParty.post(url, body: params)
    end

    def params
      {
        'plan': 'basic',
        'business_name': resource[:companyName],
        'number_of_employees': resource[:staff_api_count],
        'name': "#{resource[:firstName]} #{resource[:lastName]}",
        'work_email': resource[:email],
        'phone_number': resource[:phone],
        'details': resource[:inquiry],
        'source_url': "uk/pricing",
        'country': resource[:true_country],
        'track_lead': "first_page: #{resource[:first_page]}",
        'first_visit_date': resource[:first_visit],
        'utm_medium': resource[:utm_medium],
        'utm_source': resource[:utm_source],
        'utm_campaign': resource[:utm_campaign],
        'date_sent':  Time.now(),
        'signup_type': 'web'
      }
    end
  end
end
