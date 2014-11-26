require_relative '../predicate'
require_relative '../../../../grammar/node/phrase/verb'
require_relative '../../../../grammar/node/phrase/verb/predicate'

class Byron

  ##
  #
  #
  class IntransitivePredicateParser < PredicateParser

    def parse
      parse_a Grammar::VerbPhrase do |verb_phrase|
        if verb_phrase.intransitive?
          yield (Grammar::Predicate.new verb_phrase)
        end
      end
    end

  end
  #
  ##

end

