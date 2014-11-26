require_relative '../predicate'
require_relative '../../../../grammar/node/phrase/verb'
require_relative '../../../../grammar/node/phrase/verb/predicate'
require_relative '../../../../grammar/node/argument/verb/predicative'

class Byron

  ##
  #
  #
  class LinkingPredicateParser < PredicateParser

    def parse
      parse_a Grammar::VerbPhrase do |verb_phrase|
        if verb_phrase.linking?
          parse_a Grammar::Predicative do |predicative|
            yield (Grammar::Predicate.new verb_phrase, predicative)
          end
        end
      end
    end

  end
  #
  ##

end

