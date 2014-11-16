require_relative 'lexeme'
require_relative 'lexeme/noun'
require_relative 'lexeme/verb'
require_relative 'lexeme/adjective'
require_relative 'lexicon'

# Parsers
require_relative 'parser/word'
require_relative 'parser/word/noun'
require_relative 'parser/word/verb'
require_relative 'parser/word/adjective'
require_relative 'parser/punctuation'
require_relative 'parser/phrase/noun/simple'
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

# Evaluators

class Byron

  ##
  #
  #
  class Elementary < Plugin

    ##
    # The "Elementary" plugin. Contains all built-in lexicon, parsers and
    # evaluators.
    #
    def use (byron)

      # Lexicon
      byron.lexicon.add (
        Lexicon.from_yaml_file 'lexicon/nouns.yaml',
        Grammar::NounLexeme
      )

      byron.lexicon.add (
        Lexicon.from_yaml_file 'lexicon/verbs.yaml',
        Grammar::VerbLexeme
      )

      byron.lexicon.add (
        Lexicon.from_yaml_file 'lexicon/adjectives.yaml',
        Grammar::AdjectiveLexeme
      )

      # Parsers
      byron.use *[
        WordParser,
        NounParser,
        VerbParser,
        AdjectiveParser,
        PunctuationParser,
        SimpleNounPhraseParser,
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

      # Evaluators
      byron.use *[]

    end
  end
  #
  ##

end
