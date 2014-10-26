require_relative 'plugin'
require_relative 'lexer'
require_relative 'discourse'
require_relative 'grammar/constituent'
require_relative 'grammar/sentence'
require_relative 'lexicon'

class Byron

  ##
  #
  #
  class Parser < Lexer

    ##
    #
    #
    def initialize
      super
      @delegates = []
      @lexicon = Lexicon.new
      prepare
    end
    #
    ##

    ##
    #
    #
    def sort_delegates
      @delegates.sort! { |a, b| a <=> b } # Uh?
    end
    #
    ##

    ##
    #
    #
    def prepare(document = nil)
      super
      @stack = []
      sort_delegates
    end
    #
    ##

    ##
    # Add a delegate to this parser.
    #
    def delegate(kind, parser)
    end
    #
    ##

    ##
    #
    #
    def get_delegates(type, &block)
      delegates = []

      if block
        delegates.each do |delegate|
          @stack << delegate
          yield delegate
          @stack.pop
        end
      end

      return delegates
    end
    #
    ##

    ##
    # Parse a grammar constituent of given `type`.
    #
    def parse_constituent(type = Grammar::Constituent)
      old_node = new_node = @node
      yielt = []

      get_delegates type do |delegate|

        move_to old_node

        delegate.parse do |constituent|
          begin
            yield constituent
            new_node = @node
            yielt << constituent
          end
        end

      end

      if yielt.length == 1
        move_to new_node
        return yielt.first
      end

      move_to old_node

      if yielt.length > 1
        raise "Ambiguity (#{yielt.length})"
      else
        raise "Could not parse a #{type}"
      end
    end
    #
    ##

    ##
    # Parse a text passed as a `Document` object and return its syntactic
    # representation as a `Speech` instance.
    #
    def parse(document)
      prepare document

      discourse = Discourse.new

      skip_whitespace

      until end_of_text? do
        discourse.sentences << parse_a(Grammar::Sentence) do |sentence|
          skip_whitespace
          period =
            begin
              parse_a Grammar::Period
            rescue
              nil
            end

          unless period || start_of_block? || !important?
            raise 'Unterminated sentence' # Try again
          end
        end
        skip_whitespace
      end

      return discourse
    end
    #
    ##

    protected :prepare, :sort_delegates, :get_delegates

    alias_method :parse_a, :parse_constituent
    alias_method :parse_an, :parse_a

  end
  #
  ## class Byron::Parser

end
#
## class Byron
