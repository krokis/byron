require_relative '../phrase'
require_relative '../category/verbal'

class Byron
  module Grammar
    class VerbPhrase < Phrase
      include Category::Verbal
    end
  end
end
