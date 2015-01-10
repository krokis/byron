require_relative '../node'

class Byron
  module Grammar

    ##
    #
    #
    class Branch < Node

      def initialize (head, features = {})
        @head = head
        super features
      end

      ##
      #
      #
      def children
      end

      ##
      # Tell if this constituent has any children (a head or an argument).
      #
      def children?
        !children.empty?
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
