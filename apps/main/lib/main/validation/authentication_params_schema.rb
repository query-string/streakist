require "dry-validation"

module Main
  module Validation
    AuthenticationParamsSchema = Dry::Validation.Schema do
      required(:uid) { filled? & int? }
      required(:token) { filled? & str? }
    end
  end
end
