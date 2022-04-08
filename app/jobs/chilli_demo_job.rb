# frozen_string_literal: true

class ChilliDemoJob < ApplicationJob
  queue_as :default

  def perform(user)
  	# US | Chilipiper Notification < 20 zap: https://zapier.com/app/editor/124817668
    ::Request::Zapier.new(user).post_to_url(nil, "https://hooks.zapier.com/hooks/catch/9580904/bb1h7ir/")
  end
end