require_relative '../category/noun'
require_relative '../lexeme'

class Byron
  module Grammar

    ##
    #
    class NounLexeme < Lexeme
      include Category::Noun

      def initialize (lemma, features, forms)
      end

      def inflect (features)
      end

      def forms
      end

    end
    #
    ##

  end
end
