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
      lexemes.each do |lexeme|
        @lexemes << lexeme
        lexeme.forms.each do |word|
          unless @words.has_key? word
            @words[word] = []
          end
          @words[word] << lexeme
        end
      end
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
      lexemes = YAML.load yaml

      lexemes.each do |feats|
        if feats.has_key? :lemma
          lemma = feats.lemma
          feats.delete :lemma
          lexeme = kind.new lemma, feats
          add lexeme
      end
    end

    ##
    #
    #
    def self.from_yaml_file (path, kind)
      yaml = File.read file
      from_yaml yaml, kind
    end

  end
  #
  ##

end
