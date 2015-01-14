require_relative '../noun'
require_relative '../../../grammar/node/word/noun'
require_relative '../../../grammar/node/phrase/noun'

class Byron

  ###
  # This one reads a simple noun word and makes a phrase of it.
  #
  class SimpleNounPhraseParser < NounPhraseParser

    PARSES = Grammar::NounPhrase

    def parse
      parse_a Grammar::Noun do |noun|
        yield (Grammar::NounPhrase.new noun)
      end
    end

  end
  #
  ##

end

