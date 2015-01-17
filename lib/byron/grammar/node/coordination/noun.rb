require_relative '../coordination'
require_relative '../phrase/noun'
require_relative '../category/noun'
require_relative '../feature/number'

class Byron
  module Grammar

    ##
    #
    #
    class NounCoordination < Coordination

      include Category::Noun
      include Feature::Number

    end
    #
    ##

  end
end
