require_relative 'lexeme'
require_relative 'lexeme/adjective'
require_relative 'lexeme/noun'
require_relative 'lexeme/verb'

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

      byron.lexicon.add (
        Grammar::Lexeme.from_yaml 'lexicon/adjectives.yaml',
        Grammar::AdjectiveLexeme
      )

      byron.lexicon.add (
        Grammar::Lexeme.from_yaml 'lexicon/nouns.yaml',
        Grammar::NounLexeme
      )

      byron.lexicon.add (
        Grammar::Lexeme.from_yaml 'lexicon/verbs.yaml',
        Grammar::VerbLexeme
      )

    end

  end

end
