require_relative '../grammar/word'
require_relative 'delegate'

class Byron

  class WordParser < ParserDelegate

    ##
    #
    #
    def parse
      if parses = self.class.PARSES
        @parser.lexicon.find kind: parses do |word|
          yield (parses.new word)
        end
      end
    end
    #
    ##

  end
end
