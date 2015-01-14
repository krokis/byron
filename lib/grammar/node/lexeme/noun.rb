require_relative '../lexeme'
require_relative '../../category/noun'
require_relative '../../feature/regularity'
require_relative '../../feature/uniqueness'

class Byron
  module Grammar

    ##
    #
    class NounLexeme < Lexeme

      include Category::Noun
      include Feature::Regularity
      include Feature::Uniqueness

      def make_forms
        @forms[{
          number: :singular
        }] = @lemma

        @forms[{
          number: :plural
        }] = "#{@lemma}s"
      end

      def inflect (features)
      end

    end
    #
    ##

  end
end
