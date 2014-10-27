require_relative '../feature/person'
require_relative '../feature/number'
require_relative '../feature/tense'
require_relative '../feature/transitiveness'

class Byron
  module Grammar
    module Category
      module Verb
        include Feature::Person
        include Feature::Number
        include Feature::Tense
        include Feature::Transitiveness

        # def linking?
        # def defective?
      end
    end
  end
end
