# frozen_string_literal: true

Bugsnag.configure do |config|
  config.api_key = "745c41c8b3379590fc3ba32615b33957"
  config.app_version = ENV["HEROKU_RELEASE_VERSION"] # https://docs.bugsnag.com/build-integrations/heroku/#versioning-heroku-apps
  config.notify_release_stages = ["production"]
end
