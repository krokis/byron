require_relative '../feature/regularity'
require_relative '../feature/transitivity'
require_relative '../feature/linking'

class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Verb
        include Feature::Regularity
        include Feature::Transitivity
        include Feature::Linking
        # Feature::Defective?
      end
      #
      ##

    end
  end
end
