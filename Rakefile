require_relative "config/application"
Rails.application.load_tasks

desc "Start the server, with a webpack dev server running in the background"
task :s do
  system "bundle exec foreman start -f Procfile.dev"
end
task server: :s
