require_relative 'number'

class Byron
  module Value

    ##
    #
    #
    class Dimension < Number

      attr_accessor :unit

      def initialize (value = 0, unit = nil)
        @unit = unit
        super value
      end

    end
    #
    ##

  end
end
