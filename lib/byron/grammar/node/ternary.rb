class Byron
  module Grammar

    ##
    #
    module Ternary

      def initialize (head, left, right, features = nil)
        super head, features

        @left = left
        @right = right
      end

      def children
        [@head, @left, @right].compact
      end

    end
    #
    ##

  end
end
