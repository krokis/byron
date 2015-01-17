require_relative '../predicative'
require_relative '../../../../category/adjective'

class Byron
  module Grammar
    class AdjectivePredicative < Predicative
      include Category::Adjective
    end
  end
end
