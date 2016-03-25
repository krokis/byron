# Std-lib
require 'yaml'

require_relative 'grammar/node/lexeme/noun'
require_relative 'grammar/node/lexeme/verb'
require_relative 'grammar/node/lexeme/adjective'
require_relative 'grammar/node/word'
require_relative 'grammar/node/word/noun'
require_relative 'grammar/node/word/verb'
require_relative 'grammar/node/word/adjective'

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
        @words[word].each do |lexeme, features|
          cls = case lexeme
            when Grammar::NounLexeme
              Grammar::Noun
            when Grammar::VerbLexeme
              Grammar::Verb
            when Grammar::AdjectiveLexeme
              Grammar::Adjective
            else
              Grammar::Word
            end

          yield (cls.new lexeme.clone, features)
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

            features = {}
            forms = {}
            lemma = nil

            feats.each do |name, val|

              case name
                when 'forms'
                  # Form hints
                  val.each do |frm, fts|
                    fts = [fts] unless fts.kind_of? Array
                    forms[fts] = frm
                  end
                when 'lemma'
                  lemma = feats['lemma']
                when 'features'
                  next
                when String
                  name = name.to_sym
                  val = val.to_sym
                  features[name] = val
                else
                  raise 'Ooops'
              end

            end

            lexeme = kind.new features, lemma, forms
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
