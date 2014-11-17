require_relative '../category/noun'
require_relative '../lexeme'

class Byron
  module Grammar

    ##
    #
    class NounLexeme < Lexeme

      include Category::Noun

      def inflect (features)
      end

      def make_forms
        @forms[{
          number: :singular
        }] = @lemma

        @forms[{
          number: :plural
        }] = "#{@lemma}s"
      end

    end
    #
    ##

  end
end
