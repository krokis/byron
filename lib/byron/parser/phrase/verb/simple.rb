require_relative '../verb'
require_relative '../../../grammar/node/word/verb'
require_relative '../../../grammar/node/phrase/verb'

class Byron

  ##
  #
  #
  class SimpleVerbPhraseParser < VerbPhraseParser

    PARSES = Grammar::VerbPhrase

    def parse
      parse_a Grammar::Verb do |verb|
        yield (Grammar::VerbPhrase.new verb)
      end
    end
  end
  #
  ##

end

