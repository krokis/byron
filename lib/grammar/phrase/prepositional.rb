require_relative '../phrase'
require_relative '../category/prepositional'

class Byron
  module Grammar
    class PrepositionalPhrase < Phrase
      include Category::Prepositional
    end
  end
end
