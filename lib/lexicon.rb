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

    attr_reader :lexemes

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
        if lexeme.kind_of? self.class
          add *lexeme.lexemes
          next
        end

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
      lexicon = self.new

      lexemes.each do |feats|
        p feats
        if feats.has_key? :lemma
          lemma = feats.lemma
          feats.delete :lemma

          # Form hints
          forms = {}

          if feats.has_key? :forms
            feats[forms].each do |frm, fts|
              fts = [fts] unless fts.respond_to? :each
              fts.each do |ft|
                forms[ft] = frm
              end
            end
          end

          lexeme = kind.new lemma, feats, forms

          lexicon.add lexeme
        end
      end

      lexicon
    end

    ##
    #
    #
    def self.from_yaml_file (file, kind)
      yaml = File.read file
      self.from_yaml yaml, kind
    end

  end
  #
  ##

end
