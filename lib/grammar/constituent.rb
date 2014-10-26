require_relative 'features'

class Byron

  module Grammar

    ##
    #
    #
    class Constituent

      #
      include Features

      def initialize (head = nil, argument = nil, features = nil)
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

      ##
      # Tell if this constituent has any children (a head or an argument).
      #
      def children?
        !!(@head || @argument)
      end
      #
      ##

      ##
      #
      #
      def agrees? (other, features = nil)
      end
      #
      ##

      ##
      #
      #
      def walk
      end
      #
      ##

      ##
      #
      #
      def to_s
        "#{@source}"
      end
      #
      ##

      alias_method :is?, :kind_of?

    end
    #
    ## class Byron::Grammar::Constituent

  end
  #
  ## module Byron::Grammar

end
#
## class Byron
