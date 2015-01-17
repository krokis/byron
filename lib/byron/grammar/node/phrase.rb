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
        (@argument.kind_of? Specifier) ||
        @head && (@head.kind_of? Phrase) && @head.specifier
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
          if @head && (@head.kind_of? Phrase)
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
          if @head && (@head.kind_of? Phrase)
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
