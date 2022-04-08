# frozen_string_literal: true

class PoaJob < ApplicationJob
  queue_as :default

  def perform(user)
  	# UK Pricing POA | https://zapier.com/app/editor/52844279
    ::Request::Poa.new(user).post_to_url(nil, "https://hooks.zapier.com/hooks/catch/4543252/psanwx/")
  end
end