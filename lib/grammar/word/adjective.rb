require_relative '../category/adjective'
require_relative '../word'

class Byron
  module Grammar
    class Adjective < Word
      include Category::Adjective
    end
  end
end
