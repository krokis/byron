require_relative '../phrase'
require_relative '../category/adverb'

class Byron
  module Grammar

    ##
    #
    #
    class AdverbPhrase < Phrase
      include Category::Adverb
    end
    #
    ##

  end
end
