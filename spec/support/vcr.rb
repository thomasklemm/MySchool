VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec", "vcr")
  c.hook_into :webmock

  c.ignore_localhost = true
  # c.ignore_hosts 'api.pusherapp.com'

  # c.filter_sensitive_data('<TWITTER_CONSUMER_KEY>')    { ENV['TWITTER_CONSUMER_KEY'] }
  # c.filter_sensitive_data('<TWITTER_CONSUMER_SECRET>') { ENV['TWITTER_CONSUMER_SECRET'] }
end
