require_relative '../word'
require_relative '../../grammar/node/word/noun'

class Byron
  class NounParser < WordParser
    PARSES = Grammar::Noun
  end
end
