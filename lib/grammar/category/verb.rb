require_relative '../feature/regularity'
require_relative '../feature/transitivity'
require_relative '../feature/linking'
require_relative '../feature/defective'

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
        include Feature::Defective
      end
      #
      ##

    end
  end
end
