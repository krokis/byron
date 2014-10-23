require_relative '../category/noun'
require_relative '../word'

class Byron
  module Grammar
    class Noun < Word
      include Category::NOUN
    end
  end
end
