# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require 'rack/canonical_host'

use Rack::CanonicalHost, ENV['CANONICAL_HOST'], cache_control: 'max-age=1800' if ENV['CANONICAL_HOST']
run Rails.application
Rails.application.load_server
