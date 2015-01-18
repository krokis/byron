# Std-lib
require 'yaml'

require_relative 'grammar/node/word'
require_relative 'grammar/node/word/noun'
require_relative 'grammar/node/word/verb'
require_relative 'grammar/node/word/adjective'

class Byron

  ##
  #
  #
  class Lexicon

    attr_reader :words
    attr_reader :forms

    ##
    #
    #
    def initialize
      @words = []
      @forms = {}
    end

    ##
    # Add lexemes to this lexicon.
    #
    def add (*words)
      words.each do |word|
        if word.kind_of? self.class
          add *word.words
        else
          @words << word
          word.each_form do |form, features|
            @forms[form] ||= []
            @forms[form] << [word, features]
          end
        end
      end
    end

    ##
    # Find a word.
    #
    def find (form = nil, kind = nil)
      if @forms.has_key? form
        @forms[form].each do |word_class, features|
          yield (word_class.new features)
        end
      end
    end

    ##
    #
    #
    def self.from_yaml (yaml, kind)
      words = YAML.load yaml
      lexicon = self.new

      if words
        words.each do |wd|
          if wd.has_key? 'lemma'
            word_class = Class.new kind
            feats = {}

            wd.each do |name, val|
              case name
              when 'forms'
                # Form hints
                val.each do |frm, fts|
                  fts = [fts] unless fts.kind_of? Array
                  fts.each do |ft|
                    word_class.add_form frm, ft
                  end
                end
              when 'lemma'
                word_class.lemma = val
              when 'features'
                next
              when String
                name = name.to_sym
                val = val.to_sym
                word_class[name] = val
              else
                raise 'Ooops'
              end

            end

            lexicon.add word_class
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
