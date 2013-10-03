require 'sidekiq/web'

Sidekiq.configure_server do |config|
  # ActiveRecord connection pool size
  database_url = ENV['DATABASE_URL']
  if(database_url)
    ENV['DATABASE_URL'] = "#{database_url}?pool=10"
    ActiveRecord::Base.establish_connection
  end
end
