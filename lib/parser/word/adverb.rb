require_relative '../word'
require_relative '../grammar/word/adverb'

class Byron
  class AdverbParser < WordParser
    PARSES = Grammar::Adverb
  end
end
