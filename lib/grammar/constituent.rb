require_relative 'features'

class Byron
  module Grammar

    ##
    #
    #
    class Constituent

      #
      include Features

      def initialize(head = nil, argument = nil, features = nil)
        @head = head
        @argument = argument

        if features
          features.each do |feature, value|
            @features[feature] = value
          end
        end
      end

      ##
      #
      #
      def children
        [@head, @argument].compact
      end
      #
      ##

      def agrees (other, features = nil)
      end

      def walk
      end

      def to_s
        "#{@source}"
      end

    end
    #
    ## class Byron::Grammar::Constituent

  end
  #
  ## module Byron::Grammar

end
#
## class Byron
