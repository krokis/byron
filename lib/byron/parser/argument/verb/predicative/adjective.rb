require_relative '../predicative'
require_relative '../../../../grammar/node/argument/verb/predicative'
require_relative '../../../../grammar/node/phrase/adjective'

class Byron

  ##
  #
  #
  class AdjectivePredicativeParser < PredicativeParser
    PARSES = Grammar::Predicative

    def parse
      parse_a Grammar::AdjectivePhrase do |adj_phrase|
        yield (Grammar::Predicative.new adj_phrase)
      end
    end
  end
  #
  ##

end
