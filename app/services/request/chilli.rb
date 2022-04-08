# frozen_string_literal: true

module Request
  class Chilli < Request::Base
    def call_operation(url)
      HTTParty.post(url, body: params.to_json, :headers => { 'Content-Type' => 'application/json' } )
    end

    def params
      {
        'form': {
          'FirstName': resource[:firstName],
          'LastName': resource[:lastName],
          'Email': resource[:email],
          'Phone': resource[:phone],
          'Company': resource[:companyName],
          'Employee_Range__c': resource[:companySize],
          'utm_source__c': resource[:utm_source],
          'utm_medium__c': resource[:utm_medium],
          'utm_campaign__c': resource[:utm_campaign],
          'Signup_Type__c': 'Online Demo Booking',
          'Lead_Country_New__c': resource[:country_name],
          'GCLID__c': '',
          'utm_content__c': 'Chilipiper Button',
          'utm_term__c': 'Book a Call',
        },
        'options': {
          'router': "#{resource[:chili_region]}_Marketing_Booking",
          'debug': false,
          'map': false,
          'webHook': 'https://webhook.site/d0eadad5-426a-49ef-aba8-ebd0092cd854',
          'locale': "en_#{resource[:chili_region]}"
        }
      }
    end
  end
end