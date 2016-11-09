require "types"

module Main
  module Entities
    class Authentication < Dry::Types::Struct
      attribute :id, Types::Strict::Int
      attribute :provider, Types::Strict::String
      attribute :uid, Types::Strict::Int
      attribute :token, Types::Strict::String
      attribute :created_at, Types::Strict::Time
    end
  end
end
