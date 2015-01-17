require_relative 'element'

class Byron
  module Text

    ##
    #
    #
    class Heading < BlockElement
      attr_accessor :level

      def initialize
        @level = 0
      end

      def html_tag_name
        "h#{@level}"
      end
    end
    #
    ##

  end
end
