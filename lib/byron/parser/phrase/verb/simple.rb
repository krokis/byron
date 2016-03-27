require_relative '../verb'
require_relative '../../../grammar/node/word/verb'
require_relative '../../../grammar/node/phrase/verb/simple'

class Byron

  ##
  #
  #
  class SimpleVerbPhraseParser < VerbPhraseParser

    PARSES = Grammar::SimpleVerbPhrase

    def parse
      parse_a Grammar::Verb do |verb|
        yield (Grammar::SimpleVerbPhrase.new verb)
      end
    end
  end
  #
  ##

end

