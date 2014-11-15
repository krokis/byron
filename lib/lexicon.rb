# Std-lib
require 'yaml'

require_relative 'grammar/lexeme/noun'
require_relative 'grammar/lexeme/verb'
require_relative 'grammar/lexeme/adjective'

class Byron

  ##
  #
  #
  class Lexicon

    ##
    #
    #
    def initialize
      @lexemes = []
      @words = {}
    end

    ##
    # Add lexemes to this lexicon.
    #
    def add (*lexemes)
    end

    ##
    # Find a word (ie: a form of a lexeme).
    #
    def find (word = nil, kind = nil)
    end

    ##
    #
    #
    def self.from_yaml (yaml, kind)
      lexemes = []
      add *lexemes
    end

    ##
    #
    #
    def self.from_yaml_file (path, kind)
      yaml = nil
      from_yaml yaml, kind
    end

  end
  #
  ##

end
