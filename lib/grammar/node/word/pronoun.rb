require_relative '../word'
require_relative '../../category/noun'

class Byron
  module Grammar
    class Pronoun < Word
      include Category::Noun
    end
  end
end
