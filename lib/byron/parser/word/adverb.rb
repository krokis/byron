require_relative '../word'
require_relative '../grammar/node/word/adverb'

class Byron
  class AdverbParser < WordParser
    PARSES = Grammar::Adverb
  end
end
