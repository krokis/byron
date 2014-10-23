require_relative 'scanner'
require_relative 'parser'
require_relative 'evaluator'
require_relative 'text/document'
require_relative 'grammar/constituent'

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

  def initialize
    @plugins = []
    @scanner = Scanner.new
    @parser = Parser.new
    @evaluator = Evaluator.new
  end

  ##
  #
  def use (*plugins)
  end
  #
  ##

  def scan (text)
    unless text.is_a? String
      raise 'Cannot scan that'
    end

    @scanner.scan text
  end
  #
  ##

  def parser (text)
    if text.is_a? String
      text = scan text
    end

    unless text.is_a? Text::Document
      raise 'Cannot parse that'
    end

    @parser.parse text
  end
  #
  ##

  ##
  #
  #
  def evaluate (text)
    if text.is_a? String
      text = scan text
    end

    if text.is_a? Text::Document
      text = parse text
    end

    unless text.is_a? Grammar::Constituent
      raise 'Cannot evaluate that'
    end

    @evaluator.evaluate text
  end
  #
  ##
end
#
## class Byron
