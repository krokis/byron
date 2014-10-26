require_relative 'person'
require_relative 'number'
require_relative 'tense'
require_relative 'transitiveness'

class Byron
  module Grammar
    module Catehory
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
