require_relative '../../../grammar/word/noun'
require_relative '../../../grammar/phrase/noun'
require_relative '../noun'

class Byron

  ###
  # This one reads a simple noun word and makes a phrase of it.
  #
  class SimpleNounPhraseParser < NounPhraseParser

    def parse
      parse_a Grammar::Noun do |noun|
        yield (Grammar::NounPhrase.new noun)
      end
    end

  end
  #
  ##

end

