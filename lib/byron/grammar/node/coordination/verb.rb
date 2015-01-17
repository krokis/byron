require_relative '../coordination'
require_relative '../phrase/verb'
require_relative '../category/verb'
require_relative '../feature/tense'
require_relative '../feature/person'

class Byron
  module Grammar

    ##
    #
    class VerbCoordination < Coordination

      include Category::Verb
      include Feature::Tense
      include Feature::Person

    end
    #
    ##

  end
end
