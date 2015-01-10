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
            yield del[1]
            @stack.pop
          end
        end
      end
    end

    ##
    # Parse a grammar constituent of given `kind`.
    #
    def parse_constituent (kind = Grammar::Constituent, &block)

      puts "Trying to read a #{kind} @ #{@node.start}"

      old_node = new_node = @node

      yielt = []

      delegates_for kind do |parser|

        puts "    with a #{parser}"

        move_to old_node

        parser.call do |constituent|
          begin
            puts "    got a #{constituent}"
            if block
              yield constituent
            else
              puts "not yielding a #{constituent}"
            end

            new_node = @node
            puts "pushing a #{constituent}"
            yielt << constituent
          rescue
          end
        end
      end

      puts "yielt for #{kind}: #{yielt}"

      if yielt.length == 1
        move_to new_node
        yielt[0]
      else

        move_to old_node

        if yielt.length > 1
          raise "Ambiguity (#{yielt.length})"
        else
          nil
        end
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
        begin
          sentence = parse_a Grammar::Sentence
          puts "Sentence!!!!!!!!!!!!!!!!!!: #{sentence}"
          discourse.sentences << sentence
          skip_whitespace
        rescue Exception => e
          puts ":( #{e}"
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
