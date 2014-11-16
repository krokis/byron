require_relative '../word'
require_relative '../../grammar/node/word/verb'

class Byron
  class VerbParser < WordParser
    PARSES = Grammar::Verb
  end
end
