require_relative 'delegate'
require_relative '../grammar/node/word'

class Byron

  ##
  #
  #
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
  #
  ##

end
