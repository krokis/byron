require_relative '../lexeme'
require_relative '../../category/determiner'
require_relative '../../feature/definiteness'

class Byron
  module Grammar

    ##
    #
    class DeterminerLexeme < Lexeme

      include Category::Determiner

      include Feature::Definiteness

    end
    #
    ##

  end
end
