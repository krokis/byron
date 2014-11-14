require_relative 'constituent'

class Byron
  module Grammar

    ##
    #
    #
    class Node < Constituent

      ##
      #
      #
      def children
        nil
      end

      ##
      # Tell if this constituent has any children (a head or an argument).
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
        raise 'Oops'
      end

    end
    #
    ##

  end
end
