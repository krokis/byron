require_relative '../word'
require_relative '../../grammar/node/word/preposition'

class Byron
  class PrepositionParser < WordParser
    PARSES = Grammar::Preposition
  end
end
