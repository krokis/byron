require_relative '../lexeme'
require_relative '../../category/verb'

class Byron
  module Grammar

    ##
    #
    class VerbLexeme < Lexeme

      include Category::Verb

      def make_forms
      end

    end
    #
    ##

  end
end
