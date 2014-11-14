require_relative '../phrase'
require_relative '../category/adjectival'

class Byron
  module Grammar
    class AdjectivePhrase < Phrase
      include Category::Adjectival
    end
  end
end
