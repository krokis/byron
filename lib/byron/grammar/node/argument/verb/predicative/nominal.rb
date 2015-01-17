require_relative '../predicative'
require_relative '../../../../category/noun'

class Byron
  module Grammar
    class NominalPredicative < Predicative
      include Category::Noun
    end
  end
end
