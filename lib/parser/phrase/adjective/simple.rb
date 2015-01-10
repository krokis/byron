require_relative '../adjective'
require_relative '../../../grammar/node/word/adjective'
require_relative '../../../grammar/node/phrase/adjective'

class Byron

  ###
  # This one reads a simple noun word and makes a phrase of it.
  #
  class SimpleAdjectivePhraseParser < AdjectivePhraseParser

    PARSES = Grammar::AdjectivePhrase

    def parse
      parse_a Grammar::Adjective do |adjective|
        yield (Grammar::AdjectivePhrase.new adjective)
      end
    end

  end
  #
  ##

end

