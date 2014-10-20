require_relative 'lexer'
require_relative 'syntax/constituent'

module Byron

  class Parser < Lexer

    class Delegate
    end

    def initialize
      super
      @delegates = []
      @lexicon = []
      @prepare
    end


    def sort_delegates
    end

    def prepare(document = nil)
      super
    end

    def delegate(type, func)
    end

    def get_delegates(type)
    end

    ##
    # Parse a grammar constituent of given `type`.
    ##
    def parse_constituent(type = Syntax::Constituent)
    end

    ##
    # Parse a text passed as a `Document` object and return its syntactic
    # representation as a `Speech` instance.
    def parse(document)
    end

    protected :prepare,
              :sort_delegates,
              :get_delegates

    alias_method :parse_a, :parse_constituent
    alias_method :parse_an, :parse_a

  end

end
