require "streakist/import"

module Streakist
  class Mailer
    include Streakist::Import("logger", "postmark")

    def deliver(mail)
      logger.debug("[Streakist::Mailer] delivering: #{mail.inspect}")
      postmark.deliver(mail.to_h.merge(from: from))
    end

    private

    def from
      options.app_mailer_from_email
    end

    def options
      Container.settings
    end
  end
end
