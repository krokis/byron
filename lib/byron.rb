require_relative 'scanner'
require_relative 'parser'
require_relative 'evaluator'
require_relative 'lexicon'
require_relative 'text/document'
require_relative 'grammar/constituent'
require_relative 'elementary'

##
# The core `Byron` class.
#
class Byron

  #
  VERSION = '0.0.1'

  #
  attr_reader :scanner
  attr_reader :parser
  attr_reader :evaluator

  ##
  #
  #
  def lexicon
    @parser.lexicon
  end

  ##
  #
  def initialize
    @plugins = {}
    @scanner = Scanner.new
    @parser = Parser.new
    @evaluator = Evaluator.new
    @lexicon = Lexicon.new

    use Elementary
  end

  ##
  #
  def use (*classes)
    classes.each do |plugin_class|
      unless @plugins.has_key? plugin_class
        plugin = plugin_class.new
        plugin.use self
        @plugins[plugin_class] = plugin
      end
    end
  end

  def scan (text)
    unless text.kind_of? String
      raise 'Cannot scan that'
    end

    @scanner.scan text
  end

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
  #
  #
  def evaluate (text)
    if text.kind_of? String
      text = scan text
    end

    if text.kind_of? Text::Document
      text = parse text
    end

    unless text.kind_of? Grammar::Constituent
      raise 'Cannot evaluate that'
    end

    @evaluator.evaluate text
  end
end
