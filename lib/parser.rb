require_relative 'lexer'
require_relative 'grammar/constituent'
require_relative 'grammar/node/sentence'
require_relative 'discourse'
require_relative 'lexicon'

class Byron

  ##
  #
  #
  class Parser < Lexer

    attr_accessor :lexicon

    ##
    #
    #
    def initialize (lexicon = nil)
      @lexicon = lexicon || Lexicon.new
      @delegates = []
      prepare
    end

    ##
    #
    #
    def sort_delegates
      @delegates.sort! do |a, b|
        if (a[0]).kind_of? (b[0])
          -1
        elsif (b[0]).kind_of? (a[0])
          1
        else
          0
        end
      end
    end

    ##
    #
    #
    def prepare (document = nil)
      super
      @stack = []
      sort_delegates
    end

    ##
    # Add a delegate to this parser.
    #
    def delegate (kind, parser)
      #p 'delegating',kind, parser
      @delegates.push [kind, parser]
      #p 'now',@delegates
    end

    ##
    #
    #
    def delegates_for (kind, &block)
      delegates = []

      if block
        @delegates.each do |del|
          if del[0] <= kind
            @stack << del
            yield del[1]
            @stack.pop
          end
        end
      end

      return delegates
    end

    ##
    # Parse a grammar constituent of given `type`.
    #
    def parse_constituent (type = Grammar::Constituent)
      old_node = new_node = @node
      yielt = []

      delegates_for type do |parser|

        move_to old_node

        parser.call do |constituent|
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

    ##
    # Parse a text passed as a `Document` object and return its syntactic
    # representation as a `Discourse`.
    #
    def parse (document)
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

      discourse
    end

    protected :prepare, :sort_delegates, :delegates_for

    alias_method :parse_a, :parse_constituent
    alias_method :parse_an, :parse_a

  end
  #
  ##

end
