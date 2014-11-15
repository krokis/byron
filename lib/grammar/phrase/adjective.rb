require_relative '../phrase'
require_relative '../category/adjective'

class Byron
  module Grammar

    ##
    #
    #
    class AdjectivePhrase < Phrase
      include Category::Adjective
    end
    #
    ##

  end
end
