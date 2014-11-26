require_relative '../feature/gender'

class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Noun
        include Feature::Gender
      end
      #
      ##

    end
  end
end
