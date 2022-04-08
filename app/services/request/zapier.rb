# frozen_string_literal: true

module Request
  class Zapier < Request::Base
    def call_operation(url)
      HTTParty.post(url, body: params)
    end

    def params
      {
        'First Name': resource[:firstName],
        'Last Name':  resource[:lastName],
        'Email':  resource[:email],
        'Company':  resource[:companyName],
        'Phone':  resource[:phone],
        'Employee Range': resource[:companySize],
        'Country': resource[:true_country],
        'Signup Type':  resource[:signup_type],
        'utm_medium': resource[:utm_medium],
        'utm_source': resource[:utm_source],
        'utm_campaign': resource[:utm_campaign],
        'utm_term': "#{resource[:utm_term]}",
        'gclid': '',
        'date': Time.now(),
        'city': resource[:city],
        'region': resource[:region],
        'region_code':  resource[:region_code],
        'country_code': resource[:country_code],
        'continent_code': resource[:continent_code],
        'in_eu':  resource[:in_eu],
        'postal': resource[:postal],
        'latitude': resource[:latitude],
        'longitude':  resource[:longitude],
        'timezone': resource[:time_zone],
        'country':  resource[:true_country],
        'pageURL':  resource[:pageURL],
        'firstPage': resource[:first_page]
      }
    end
  end
end
