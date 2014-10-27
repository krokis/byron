require_relative '../feature/number'
require_relative '../feature/uniqueness'
require_relative '../feature/regularity'

class Byron
  module Grammar
    module Category
      module Noun
        include Feature::Number
      end
    end
  end
end
