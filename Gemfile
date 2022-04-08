source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby(`cat .ruby-version`.chomp.gsub("ruby-", ""))

gem 'rails', '~> 7'
gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'

gem 'turbo-rails'
gem "tailwindcss-rails"

gem "httparty"
gem "recaptcha"
gem "intercom-rails"

gem 'sidekiq'
gem 'redis', '~> 4.0'
gem 'hiredis'

gem 'bootsnap', '>= 1.4.4', require: false

gem "lograge"
gem "bugsnag"
gem 'rack-canonical-host'
gem 'rails-controller-testing'
gem 'rack-attack'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.13.1'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "foreman"
  gem 'sitemap_generator'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
