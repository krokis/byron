require_relative '../plugin'

class Byron
  ##
  #
  #
  class ParserDelegate < Plugin

    parses = nil

    class << self
      attr_reader :parses
    end

    def initialize
      @parser = nil
    end

    ##
    #
    #
    def use (byron)
      if @@parses
        @parser = byron.parser
        @parser.delegate @@parses, self
      end
    end
    #
    ##

    def method_missing (method, *args)
      @parser.send method, *args
    end

    def respond_to_missing?(name, include_private = false)
      @parser && (@parser.respond_to? name, include_private)
    end

    def parse
      raise 'Oops'
    end
  end
  #
  ## class Byron::ParserDelegate

end
