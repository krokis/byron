require_relative '../verb'
require_relative '../../../grammar/node/phrase/verb/predicate'

class Byron

  ##
  #
  class PredicateParser < VerbPhraseParser
    PARSES = Grammar::Predicate
  end
  #
  ##

end

