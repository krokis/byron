require_relative '../phrase'
require_relative '../../category/noun'
require_relative '../../feature/definiteness'

class Byron
  module Grammar

    ##
    #
    #
    class NounPhrase < Phrase
      include Category::Noun
      include Feature::Definiteness
    end
    #
    ##

  end
end
