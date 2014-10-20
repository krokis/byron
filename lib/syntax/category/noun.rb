require_relative 'number'
require_relative 'uniqueness'
require_relative 'regularity'

module Byron
  module Syntax
    module Category
      module Noun
        include Number
        include Uniqueness
        include Regularity
      end
    end
  end
end
