require_relative '../category/noun'
require_relative '../lexeme'

class Byron
  module Grammar

    ##
    #
    class NounLexeme < Lexeme
      include Category::Noun
    end
    #
    ##

  end
end
