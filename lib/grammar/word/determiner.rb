require_relative '../category/determiner'
require_relative '../feature/number'

class Byron
  module Grammar
    class Determiner < Word
      include Category::Determiner
      include Feature::Number
    end
  end
end
