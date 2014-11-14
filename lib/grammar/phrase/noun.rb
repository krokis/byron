require_relative '../phrase'
require_relative '../category/nominal'
require_relative '../feature/definiteness'

class Byron
  module Grammar
    class NounPhrase < Phrase
      include Category::Nominal
      include Feature::Definiteness
    end
  end
end
