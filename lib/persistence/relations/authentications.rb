module Persistence
  module Relations
    class Authentications < ROM::Relation[:sql]
      # @TODO: Investigate why this relation breaks migrations
      schema :authentications, infer: true

      def by_id(id)
        where(id: id)
      end
    end
  end
end
