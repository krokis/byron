require_relative 'features'

module Byron
  module Syntax

    class Constituent

      def initialize(head, argument = nil, features = nil)
        @features = Features.new features
      end

    end

  end
end
