require_relative '../category/verb'
require_relative '../lexeme'

class Byron
  module Grammar

    ##
    #
    class VerbLexeme < Lexeme
      include Category::Verb
    end
    #
    ##

  end
end
