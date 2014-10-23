require_relative 'features'

class Byron
  module Grammar

    class Constituent

      def initialize(head, argument = nil, features = nil)
        @features = Features.new features
      end

    end

  end
end
