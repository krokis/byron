require_relative 'delegate'

class Byron

  ##
  #
  #
  class PunctuationParser < ParserDelegate

    ##
    #
    #
    def parse
      if self.class::PARSES
        if token = read_punctuation
          if self.class::PARSES.forms.include? token.value
            yield self.class::PARSES.new
          end
        end
      end
    end

  end
  #
  ##

end
