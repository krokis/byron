require_relative 'element'

class Byron
  module Text

    ##
    #
    #
    class Emphasis < InlineElement
      attr_accessor :strong

      def initialize
        super
        @strong = false
      end

      alias_method :strong?, :strong
    end
    #
    ##

  end
end
