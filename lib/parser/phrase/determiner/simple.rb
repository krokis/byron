require_relative '../determiner'
require_relative '../../../grammar/node/word/determiner'
require_relative '../../../grammar/node/phrase/determiner'

class Byron

  ###
  # This one reads a simple noun word and makes a phrase of it.
  #
  class SimpleDeterminerPhraseParser < DeterminerPhraseParser

    PARSES = Grammar::DeterminerPhrase

    def parse
      parse_a Grammar::Determiner do |det|
        yield (Grammar::DeterminerPhrase.new det)
      end
    end

  end
  #
  ##

end

