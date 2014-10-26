require_relative 'number'
require_relative 'uniqueness'
require_relative 'regularity'

class Byron
  module Grammar
    module Category
      module Noun
        include Feature::Number
      end
    end
  end
end
