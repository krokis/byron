require_relative '../predicate'
require_relative '../../../../grammar/node/phrase/verb'
require_relative '../../../../grammar/node/phrase/verb/predicate'
require_relative '../../../../grammar/node/argument/verb/object/direct'

class Byron

  ##
  #
  #
  class TransitivePredicateParser < PredicateParser

    def parse
      parse_a Grammar::VerbPhrase do |verb|
        if verb_phrase.intransitive?
          parse_a Grammar::DirectObject do |direct_object|
            yield (Grammar::Predicate.new verb, direct_object)
          end
        end
      end
    end

  end
  #
  ##

end

