require_relative '../word'
require_relative '../../grammar/word/adjective'

class Byron
  class AdjectiveParser < WordParser
    PARSES = Grammar::Adjective
  end
end
