require_relative '../category/noun'
require_relative '../word'

module Byron
  module Grammar
    class Noun < Word
      include Category::NOUN
    end
  end
end
