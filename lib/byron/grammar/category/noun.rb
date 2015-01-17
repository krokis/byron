require_relative '../feature/number'
require_relative '../feature/gender'
require_relative '../feature/definiteness'


class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Noun
        include Feature::Number
        include Feature::Gender
        include Feature::Definiteness
      end
      #
      ##

    end
  end
end
