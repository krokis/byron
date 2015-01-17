require_relative '../predicate'
require_relative '../../../binary'

class Byron
  module Grammar
    class TransitivePredicate < Predicate
      include Binary
    end
  end
end
