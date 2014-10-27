require_relative 'delegate'
require_relative '../grammar/sentence'
require_relative '../grammar/phrase/verb/clause/main'

class Byron

  ##
  #
  class SentenceParser < ParserDelegate

    PARSES = Grammar::Sentence

    def parse
      parse_a Grammar::MainClause do |clause|
        yield (Grammar::Sentence.new clause)
      end
    end
  end
  #
  ##

end
