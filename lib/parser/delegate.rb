require_relative '../plugin'

class Byron

  ##
  #
  #
  class ParserDelegate < Plugin

    ##
    # The kind of constituent this delegate can parse.
    #
    PARSES = nil

    def initialize
      @parser = nil
    end

    ##
    #
    #
    def use (byron)
      if parses = self.class::PARSES
        @parser = byron.parser
        @parser.delegate parses, (method :parse)
      end
    end

    def method_missing (method, *args, &block)
      @parser.__send__ method, *args, &block
    end

    def respond_to_missing?(name, include_private = false)
      @parser && (@parser.respond_to? name, include_private)
    end

    def parse
    end
  end
  #
  ##

end
