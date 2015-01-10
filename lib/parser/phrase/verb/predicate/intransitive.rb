require_relative '../predicate/intransitive'
require_relative '../../../../grammar/node/phrase/verb'
require_relative '../../../../grammar/node/phrase/verb/predicate'
require_relative '../../../../grammar/node/phrase/verb/predicate/intransitive'

class Byron

  ##
  #
  #
  class IntransitivePredicateParser < PredicateParser

    def parse
      parse_a Grammar::VerbPhrase do |phrase|
        if phrase.verb.intransitive?
          yield (Grammar::IntransitivePredicate.new phrase)
        end
      end
    end

  end
  #
  ##

end

