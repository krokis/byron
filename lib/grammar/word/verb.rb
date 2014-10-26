require_relative '../word'
require_relative '../category/verb'
require_relative '../feature/regularity'

class Byron
  module Grammar
    class Verb < Word
      include Category::Verb
      include Feature::Regularity
    end
  end
end
