require_relative 'person'
require_relative 'number'
require_relative 'tense'
require_relative 'regularity'
require_relative 'transitiveness'

module Byron
  module Syntax
    module Category
      module Verb
        include Person
        include Number
        include Tense
        include Regularity
        include Transitiveness

        # def linking?
        # def defective?
      end
    end
  end
end
