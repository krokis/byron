require_relative '../value'

class Byron
  module Value

    ##
    #
    #
    class Number

      attr_accessor :value

      def initialize (value = 0)
        @value = value
      end

    end
    #
    ##

  end
end
