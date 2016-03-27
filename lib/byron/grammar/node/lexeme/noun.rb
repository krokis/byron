require_relative '../lexeme'
require_relative '../../category/noun'
require_relative '../../feature/regularity'
require_relative '../../feature/uniqueness'
require_relative '../../feature/gender'
require_relative '../../feature/countable'

class Byron
  module Grammar

    ##
    #
    class NounLexeme < Lexeme

      include Category::Noun

      include Feature::Regularity
      include Feature::Uniqueness
      include Feature::Gender
      include Feature::Countable

      def make_singular_form
        @lemma
      end

      def make_plural_form
        "#{@lemma}s"
      end

      def make_form (features)
        if singular?
          make_singular_form
        else
          make_plural_form
        end
      end

    end
    #
    ##

  end
end
