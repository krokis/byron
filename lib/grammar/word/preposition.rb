require_relative '../word'
require_relative '../category/preposition'

class Byron
  module Grammar
    class Preposition < Word
      include Category::Preposition
    end
  end
end
