require_relative '../category/adjective'
require_relative '../lexeme'

class Byron
  module Grammar

    ##
    #
    class AdjectiveLexeme < Lexeme
      include Category::Adjective
    end
    #
    ##

  end
end
