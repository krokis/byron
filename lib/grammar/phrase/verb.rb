require_relative '../phrase'
require_relative '../category/verb'

class Byron
  module Grammar
    class VerbPhrase < Phrase
      include Category::Verb
    end
  end
end
