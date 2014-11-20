require_relative '../predicate'
require_relative '../../../../grammar/node/phrase/verb'
require_relative '../../../../grammar/node/phrase/verb/predicate'

class Byron

  ##
  #
  #
  class IntransitivePredicateParser < PredicateParser

    def parse
      parse_a Grammar::VerbPhrase do |verb|
        # Check verb phrase's head verb(s) is intransitive...
        yield (Grammar::Predicate.new verb)
      end
    end

  end
  #
  ##

end

