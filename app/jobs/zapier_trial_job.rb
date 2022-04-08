# frozen_string_literal: true

class ZapierTrialJob < ApplicationJob
  queue_as :default

  def perform(user)
  	# US | UK Lead zap: https://zapier.com/app/zap/118805140 (posts to clearbit/SF/workplace etc.)
    ::Request::Zapier.new(user).post_to_url(nil, "https://hooks.zapier.com/hooks/catch/9580904/oje5ac2/")
		if user[:true_country] != "United States" && user[:true_country] != "Canada"
		  # UK only - UKNotification action (old website)
		  ::Request::Zapier.new(user).post_to_url(nil, "https://hooks.zapier.com/hooks/catch/9580904/byqo8l6/")
		end
  end
end