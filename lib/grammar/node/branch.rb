require_relative '../node'

class Byron
  module Grammar

    ##
    #
    #
    class Branch < Node

      attr_accessor :head
      attr_accessor :argument

      def initialize (head = nil, argument = nil, features = nil)
        @head = head
        @argument = argument

        super features
      end

      ##
      #
      #
      def children
        [@head, @argument].compact
      end

      ##
      # Tell if this constituent has any children (a head or an argument).
      #
      def children?
        !!(@head || @argument)
      end

      ##
      #
      #
      def walk
      end

    end
    #
    ##

  end
end
