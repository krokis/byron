require_relative '../lexeme'
require_relative '../../category/verb'
require_relative '../../feature/regularity'
require_relative '../../feature/defective'

class Byron
  module Grammar

    ##
    #
    class VerbLexeme < Lexeme

      include Category::Verb
      include Feature::Regularity
      include Feature::Defective

      def make_forms
      end

    end
    #
    ##

  end
end
