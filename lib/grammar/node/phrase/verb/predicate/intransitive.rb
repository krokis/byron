require_relative '../predicate'
require_relative '../../../unary'

class Byron
  module Grammar
    class IntransitivePredicate < Predicate
      include Unary
    end
  end
end
