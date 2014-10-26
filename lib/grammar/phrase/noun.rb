require_relative '../phrase'
require_relative '../category/noun'

class Byron
  module Grammar
    class NounPhrase < Phrase
      include Category::Noun
    end
  end
end
