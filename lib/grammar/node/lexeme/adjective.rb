require_relative '../lexeme'
require_relative '../../category/adjective'
require_relative '../../feature/regularity'

class Byron
  module Grammar

    ##
    #
    class AdjectiveLexeme < Lexeme

      include Category::Adjective
      include Feature::Regularity

      def make_forms
        @forms[{}] = @lemma
      end

    end
    #
    ##

  end
end
