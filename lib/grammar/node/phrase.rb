require_relative 'branch'
require_relative 'argument/specifier'
require_relative 'argument/complement'
require_relative 'argument/adjunct'

class Byron
  module Grammar

    ##
    #
    #
    class Phrase < Branch

      ##
      #
      #
      def specifier
        (@argument.kind_of? Specifier) || @head && @head.specifier
      end

      def specifier?
        !!specifier
      end

      ##
      #
      #
      def complements
        complements = []
        if @argument.kind_of? Complement
          complements << @arguments
          if @head
            complements += @head.complements
          end
        end
        complements
      end

      def complements?
        !complements.empty?
      end

      ##
      #
      #
      def adjuncts
        adjuncts = []
        if @argument.kind_of? Adjunct
          adjuncts << @arguments
          if @head
            adjuncts += @head.adjuncts
          end
        end
        adjuncts
      end

      def adjuncts?
        !adjuncts.empty?
      end

    end
    #
    ##

  end
end
