require_relative '../grammar/word'
require_relative 'delegate'

class Byron

  class WordParser < ParserDelegate

    ##
    #
    #
    def parse
      #search = word: read_word, kind: self.class.PARSES
      #@parser.lexicon.find **search, word: word do |lexeme|
      @parser.lexicon.find kind: self.class.PARSES, word: word do |lexeme|
        yield self.class.PARSES.new search
      end
    end
    #
    ##

  end
end
