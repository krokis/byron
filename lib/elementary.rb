require_relative 'grammar/lexeme'
require_relative 'grammar/lexeme/noun'
require_relative 'grammar/lexeme/verb'
require_relative 'grammar/lexeme/adjective'
require_relative 'lexicon'

# Parsers
require_relative 'parser/word'
require_relative 'parser/word/noun'
require_relative 'parser/word/verb'
require_relative 'parser/word/adjective'
require_relative 'parser/phrase/noun/simple'
require_relative 'parser/phrase/noun/determined'
require_relative 'parser/phrase/noun/undetermined'
require_relative 'parser/phrase/noun/adjectived'
require_relative 'parser/phrase/verb/simple'
require_relative 'parser/phrase/verb/predicate/linking'
require_relative 'parser/phrase/verb/predicate/intransitive'
require_relative 'parser/phrase/verb/predicate/transitive'
require_relative 'parser/phrase/verb/predicate/ditransitive'
require_relative 'parser/phrase/verb/clause/main/declarative'
require_relative 'parser/argument/verb/subject'
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
      nouns_yaml = File.expand_path 'lexicon/nouns.yaml', (File.dirname __FILE__)
      byron.lexicon.add (
        Lexicon.from_yaml_file nouns_yaml,
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
        SimpleNounPhraseParser,
        UndeterminedNounPhraseParser,
        AdjectivedNounPhraseParser,
        DeterminedNounPhraseParser,
        SimpleVerbPhraseParser,
        LinkingPredicateParser,
        IntransitivePredicateParser,
        TransitivePredicateParser,
        DitransitivePredicateParser,
        SubjectParser,
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
