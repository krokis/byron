require_relative '../feature/definiteness'

class Byron
  module Grammar
    module Category

      ###
      #
      module Determiner
        include Feature::Definiteness
      end
      #
      ##

    end
  end
end
