require_relative '../../argument'
require_relative '../../../grammar/node/argument/verb/subject'
require_relative '../../../grammar/node/phrase/noun'

class Byron

  ##
  #
  #
  class SubjectParser < ArgumentParser

    PARSES = Grammar::Subject

    def parse
      parse_a Grammar::NounPhrase do |noun_phrase|
        if noun_phrase.definite?
          yield (Grammar::Subject.new noun_phrase)
        end
      end
    end
  end
  #
  ##

end
