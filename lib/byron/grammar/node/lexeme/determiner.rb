require_relative '../lexeme'
require_relative '../../category/determiner'

class Byron
  module Grammar

    ##
    #
    class DeterminerLexeme < Lexeme

      include Category::Determiner

      def make_forms
        @forms[{}] = @lemma
      end

    end
    #
    ##

  end
end
