require_relative '../feature/regularity'
require_relative '../feature/gender'

class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Noun
        include Feature::Regularity
        include Feature::Gender
      end
      #
      ##

    end
  end
end
