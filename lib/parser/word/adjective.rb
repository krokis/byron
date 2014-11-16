require_relative '../word'
require_relative '../../grammar/node/word/adjective'

class Byron
  class AdjectiveParser < WordParser
    PARSES = Grammar::Adjective
  end
end
