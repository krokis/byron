require_relative '../phrase'
require_relative '../word/noun'
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
        if @head
          if specifier?
            :definite
          elsif @head.class.include? Feature::Definiteness
            @head.definiteness
          end
        else
          nil
        end
      end

      ##
      # Get head(est) noun.
      #
      def noun
        noun = self

        while noun
          return noun if noun.kind_of? Lexeme
          begin
            noun = noun.head
          rescue
          end
        end

        nil
      end

      def number
        @head && @head.number
      end

      def determiner
      end

      alias_method :determined?, :specifier?

    end
    #
    ##

  end
end
