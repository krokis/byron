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

    end
    #
    ##

  end
end
