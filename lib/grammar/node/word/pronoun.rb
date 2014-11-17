require_relative '../word'
require_relative '../../category/pronoun'

class Byron
  module Grammar
    class Pronoun < Word
      include Category::Pronoun
    end
  end
end
