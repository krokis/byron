require_relative '../feature/regularity'
require_relative '../feature/transitivity'

class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Verb
        include Feature::Regularity
        include Feature::Transitivity
        # def linking?
        # def defective?
      end
      #
      ##

    end
  end
end
