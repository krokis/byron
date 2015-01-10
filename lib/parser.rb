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
        if a[0] < b[0]
          -1
        elsif b[0] < a[0]
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
      @delegates.push [kind, parser]
    end

    ##
    #
    #
    def delegates_for (kind)
      @delegates.each do |del|
        if del[0] <= kind
          unless @stack.include? del
            @stack << del
            begin
              yield del[1]
            rescue Exception => e
              puts ":( #{e}"
              puts e.backtrace
            end
            @stack.pop
          end
        end
      end
    end

    ##
    # Parse a grammar constituent of given `kind`.
    #
    def parse_constituent (kind = Grammar::Constituent, &block)
      old_node = new_node = @node

      yielt = []

      puts "Trying to read a #{kind}"

      delegates_for kind do |parser|
        puts "With a #{parser}"
        move_to old_node

        begin
          parser.call do |constituent|
            puts "Got a #{constituent}"
            yield constituent if block
            new_node = @node
            yielt << constituent
          end
        rescue Exception => e
          puts ":( #{e}"
          puts e.backtrace
        end
      end

      if yielt.length == 1
        move_to new_node
        yielt[0]
      else
        move_to old_node

        if yielt.length > 1
          puts "AMBIGUITY for #{kind}!!! (#{yielt.length})"
        end

        nil
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
        if sentence = (parse_a Grammar::Sentence)
          discourse.sentences << sentence
          skip_whitespace
        else
          break
        end
      end

      discourse
    end

    protected    :prepare,
                 :sort_delegates,
                 :delegates_for
    alias_method :parse_a, :parse_constituent
    alias_method :parse_an, :parse_a

  end
  #
  ##

end
