require_relative 'scanner'
require_relative 'parser'
require_relative 'evaluator'
require_relative 'lexicon'
require_relative 'text/document'
require_relative 'grammar/node'
require_relative 'elementary'

##
# The core `Byron` class.
#
class Byron

  VERSION = '0.0.1'

  #
  attr_reader :scanner
  attr_reader :parser
  attr_reader :evaluator

  # Proxy to parser's lexicon.
  def lexicon
    @parser.lexicon
  end

  def lexicon= (lexicon)
    @parser.lexicon = lexicon
  end

  ##
  #
  def initialize
    # Used plugins
    @plugins = {}

    # Initialize all components.
    @scanner   = Scanner.new
    @parser    = Parser.new
    @evaluator = Evaluator.new

    # Use the `Elementary` core plugin; it provides all basic grammar parsers,
    # evaluators and lexicon.
    use Elementary
  end

  ##
  # Use one or more plugins on this instance.
  #
  def use (*plugins)
    plugins.each do |plugin_class|
      unless @plugins.has_key? plugin_class
        plugin = plugin_class.new
        plugin.use self
        @plugins[plugin_class] = plugin
      end
    end
  end

  ##
  # Scan a text an return a `Document` instance.
  #
  def scan (text)
    unless text.kind_of? String
      raise 'Cannot scan that'
    end

    @scanner.scan text
  end

  ##
  # Parse a text or a `Document` and return a `Discourse`.
  #
  def parse (text)
    if text.kind_of? String
      text = scan text
    end

    unless text.kind_of? Text::Document
      raise 'Cannot parse that'
    end

    @parser.parse text
  end

  ##
  # Evaluate a text, a `Document` or a `Discourse`.
  #
  def evaluate (text)
    if text.kind_of? String
      text = scan text
    end

    if text.kind_of? Text::Document
      text = parse text
    end

    unless text.kind_of? Grammar::Node
      raise 'Cannot evaluate that!'
    end

    @evaluator.evaluate text
  end

end
#
##
