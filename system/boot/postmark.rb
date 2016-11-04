Streakist::Container.finalize :postmark do |container|
  require "postmark"
  container.register "postmark", Postmark::ApiClient.new(Streakist::Container.settings.postmark_api_key)
end
