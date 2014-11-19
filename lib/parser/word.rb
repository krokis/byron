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
      if parses = self.class::PARSES
        puts "reading a word at", node.start
        if wd = read_word
          puts wd.value
          @parser.lexicon.find wd, parses do |word|
            yield word
          end
        end
      end
    end

  end
  #
  ##

end
