require_relative '../word'
require_relative '../../grammar/word/preposition'

class Byron
  class PrepositionParser < WordParser
    PARSES = Grammar::Preposition
  end
end
