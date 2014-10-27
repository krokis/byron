require_relative '../word'
require_relative '../../grammar/word/verb'

class Byron
  class VerbParser < WordParser
    PARSES = Grammar::Verb
  end
end
