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
    attr_reader :words

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

        lexeme.forms.each do |feats, word|
          @words[word] ||= []
          @words[word] << [lexeme, feats]
        end
      end
    end

    ##
    # Find a word (ie: a form of a lexeme).
    #
    def find (word = nil, kind = nil)
      if @words.has_key? word
        @words[word].map! do |wd|
          if wd.kind_of? Array
            wd = @wd[0].new @wd[1]
          end

          yield wd
          wd
        end
      end
    end

    ##
    #
    #
    def self.from_yaml (yaml, kind)
      lexemes = YAML.load yaml
      lexicon = self.new

      if lexemes
        lexemes.each do |feats|

          if feats.has_key? 'lemma'
            lemma = feats['lemma']
            feats.delete 'lemma'

            # Form hints
            forms = {}

            if feats.has_key? 'forms'
              feats['forms'].each do |frm, fts|
                fts = [fts] unless fts.kind_of? Array
                fts.each do |ft|
                  forms[ft] = frm
                end
              end
            end

            lexeme = kind.new lemma, feats, forms

            lexicon.add lexeme
          end
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
