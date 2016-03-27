require_relative '../phrase'
require_relative '../word'
require_relative '../../category/noun'
require_relative '../../feature/number'
require_relative '../../feature/definiteness'

class Byron
  module Grammar

    ##
    #
    #
    class NounPhrase < Phrase

      include Category::Noun

      include Feature::Number
      include Feature::Definiteness

      def definiteness
        if specifier?
          :definite
        elsif @head.class.include? Feature::Definiteness
          @head.definiteness
        # else what?
        end
      end

      def number
        @head && @head.number
      end

      def determiner
        specifier
      end

      alias_method :determined?, :specifier?

    end
    #
    ##

  end
end
