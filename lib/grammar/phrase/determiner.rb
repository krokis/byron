require_relative '../phrase'
require_relative '../category/determiner'

class Byron
  module Grammar

    ##
    #
    #
    class DeterminerPhrase < Phrase
      include Category::Determiner
    end
    #
    ##

  end
end
