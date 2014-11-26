require_relative 'features'

class Byron
  module Grammar

    ##
    #
    #
    class Node

      include Features

      ##
      #
      #
      def children
        []
      end

      ##
      # Tell if this constituent has any children.
      #
      def children?
        false
      end

      ##
      #
      #
      def walk
        children.each do |child|
          yield child
        end
      end

      ##
      #
      #
      def to_s
        self.class.name
      end

    end
    #
    ##

  end
end
