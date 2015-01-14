require_relative '../features'
require_relative '../feature/definiteness'

class Byron
  module Grammar
    module Category

      ###
      #
      module Determiner

        include Features
        include Feature::Definiteness

      end
      #
      ##

    end
  end
end
