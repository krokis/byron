require_relative '../noun'
require_relative 'undetermined'
require_relative '../../../grammar/node/phrase/noun/determined'
require_relative '../../../grammar/node/phrase/noun/undetermined'

class Byron

  ##
  #
  #
  class DeterminedNounPhraseParser < NounPhraseParser

    PARSES = Grammar::DeterminedNounPhrase

    def parse
      parse_a Grammar::UndeterminedNounPhrase do |noun|
        yield Grammar::DeterminedNounPhrase.new noun
      end
    end

  end
  #
  ##

end

