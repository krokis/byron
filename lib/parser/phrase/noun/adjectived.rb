require_relative '../noun'
require_relative '../../../grammar/node/phrase/noun'
require_relative '../../../grammar/node/argument/noun/adjunct'

class Byron

  ##
  #
  #
  class AdjectivedNounPhraseParser < NounPhraseParser

    def parse
      parse_a Grammar::AdjectiveNounAdjunct do |adjunct|
        parse_a Grammar::NounPhrase do |noun|
          yield (Grammar::NounPhrase.new noun, adjunct)
        end
      end
    end

  end
  #
  ##

end

