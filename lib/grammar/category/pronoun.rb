require_relative '../features/number'
require_relative '../features/gender'

class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Pronoun
        include Feature::Number
        include Feature::Gender
      end
      #
      ##

    end
  end
end
