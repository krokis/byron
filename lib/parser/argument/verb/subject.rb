require_relative '../../argument'
require_relative '../../../grammar/node/argument/verb/subject'
require_relative '../../../grammar/node/phrase/noun/determined'

class Byron

  ##
  #
  #
  class SubjectParser < ArgumentParser

    PARSES = Grammar::Subject

    def parse
      parse_a Grammar::DeterminedNounPhrase do |noun_phrase|
        yield (Grammar::Subject.new noun_phrase)
      end
    end
  end
  #
  ##

end
