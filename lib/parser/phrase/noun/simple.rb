require_relative 'undetermined'
require_relative '../../../grammar/node/word/noun'
require_relative '../../../grammar/node/phrase/noun/undetermined'

class Byron

  ###
  # This one reads a simple noun word and makes a phrase of it.
  #
  class SimpleNounPhraseParser < UndeterminedNounPhraseParser

    PARSES = Grammar::UndeterminedNounPhrase

    def parse
      parse_a Grammar::Noun do |noun|
        yield (Grammar::UndeterminedNounPhrase.new noun)
      end
    end

  end
  #
  ##

end

