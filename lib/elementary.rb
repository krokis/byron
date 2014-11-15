require_relative 'lexeme'
require_relative 'lexicon'

##
# Parsers
#
require_relative 'parser/word'
require_relative 'parser/word/noun'
require_relative 'parser/word/verb'
require_relative 'parser/word/adjective'
require_relative 'parser/punctuation'
require_relative 'parser/phrase/noun/simple'
require_relative 'parser/phrase/noun/simple/mass'
require_relative 'parser/phrase/noun/simple/proper'
require_relative 'parser/phrase/noun/determined'
require_relative 'parser/phrase/noun/undetermined'
require_relative 'parser/phrase/noun/adjectived'
require_relative 'parser/phrase/verb/simple'
require_relative 'parser/phrase/verb/simple/linking'
require_relative 'parser/phrase/verb/simple/intransitive'
require_relative 'parser/phrase/verb/simple/transitive'
require_relative 'parser/phrase/verb/simple/ditransitive'
require_relative 'parser/phrase/verb/clause/main/declarative'
require_relative 'parser/sentence'

class Byron

  ##
  #
  #
  class Elementary < Plugin

    ##
    #
    #
    def use (byron)

      # Lexicon
      byron.lexicon.add (
        Lexicon.from_yaml_file 'lexicon/adjectives.yaml',
        Grammar::Category::Adjective
      )

      byron.lexicon.add (
        Lexion.from_yaml_file 'lexicon/nouns.yaml',
        Grammar::Category::Noun
      )

      byron.lexicon.add (
        Lexicon.from_yaml_file 'lexicon/verbs.yaml',
        Grammar::Category::Verb
      )

      # Parsers
      byron.use *[
        WordParser,
        NounParser,
        VerbParser,
        AdjectiveParser,
        PunctuationParser,
        SimpleNounPhraseParser,
        SimpleMassNounPhraseParser,
        SimpleProperNounPhraseParser,
        DeterminedNounPhraseParser,
        UndeterminedNounPhraseParser,
        AdjectivedNounPhraseParser,
        SimpleVerbPhraseParser,
        SimpleLinkingVerbPhraseParser,
        SimpleIntransitiveVerbPhraseParser,
        SimpleTransitiveVerbPhraseParser,
        SimpleDitransitiveVerbPhraseParser,
        DeclarativeClauseParser,
        SentenceParser
      ]
    end
  end
  #
  ##

end
