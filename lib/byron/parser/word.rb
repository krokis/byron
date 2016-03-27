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
        if wd = read_word
          lexicon.find(wd.value, parses) do |word|
            yield word
          end
        end
      end
    end

  end
  #
  ##

end
