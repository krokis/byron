require_relative '../lexeme'
require_relative '../../category/noun'
require_relative '../../feature/regularity'

class Byron
  module Grammar

    ##
    #
    class NounLexeme < Lexeme

      include Category::Noun
      include Feature::Regularity

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
