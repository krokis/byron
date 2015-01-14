require_relative '../noun'
require_relative '../../../grammar/node/phrase/noun'

class Byron

  ##
  #
  #
  class DeterminedNounPhraseParser < NounPhraseParser

    #PARSES = Grammar::NounPhrase
    PARSES = nil

    def parse
      parse_a Grammar::NounPhrase do |noun|
        unless noun.specifier?
          yield (Grammar::NounPhrase.new noun)
        end
      end
    end

  end
  #
  ##

end

