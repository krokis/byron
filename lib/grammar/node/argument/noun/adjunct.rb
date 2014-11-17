require_relative 'argument'
require_relative '../adjunct'

class Byron
  module Grammar
    class NounAdjunct < NounArgument
      include Adjunct
    end
  end
end
