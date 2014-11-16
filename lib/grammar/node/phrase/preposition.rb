require_relative '../phrase'
require_relative '../category/preposition'

class Byron
  module Grammar

    ##
    #
    #
    class PrepositionPhrase < Phrase
      include Category::Preposition
    end
    #
    ##

  end
end
