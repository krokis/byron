require_relative 'features'
require_relative 'argument'
require_relative 'argument/specifier'
require_relative 'argument/adjunct'
require_relative 'argument/complement'

class Byron
  module Grammar

    ##
    #
    #
    class Constituent

      #
      include Features

      def initialize(head, argument = nil, features = nil)
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
      def specifier
        @argument.kind_of? Specifier ? @argument : nil
      end
      #
      ##

      ##
      #
      #
      def adjunct
        @argument.kind_of? Adjunct ? @argument : nil
      end
      #
      ##

      ##
      #
      #
      def complement
        @argument.kind_of? Complement ? @argument : nil
      end
      #
      ##

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
end
