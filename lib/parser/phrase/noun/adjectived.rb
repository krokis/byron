require_relative '../../../grammar/node/phrase/noun'
require_relative '../../../grammar/node/argument/noun/adjunct'
require_relative 'undetermined'

class Byron

  ##
  #
  #
  class AdjectivedNounPhraseParser < UndeterminedNounPhraseParser

    def parse
      parse_a Grammar::AdjectiveNounAdjunct do |adjunct|
        parse_a Grammar::UndeterminedNounPhrase do |noun|
          yield (Grammar::NounPhrase.new noun, adjunct)
        end
      end
    end

  end
  #
  ##

end

