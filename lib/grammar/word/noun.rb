require_relative '../feature/noun'
require_relative '../word'

class Byron
  module Grammar
    class Noun < Word
      include Feature::NOUN
    end
  end
end
