require_relative '../phrase'
require_relative '../category/adverbial'

class Byron
  module Grammar
    class AdverbPhrase < Phrase
      include Category::Adverbial
    end
  end
end
