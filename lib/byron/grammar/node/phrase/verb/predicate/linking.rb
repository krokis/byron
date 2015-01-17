require_relative '../predicate'
require_relative '../../../binary'

class Byron
  module Grammar
    class LinkingPredicate < Predicate
      include Binary
    end
  end
end
