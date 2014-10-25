require_relative 'number'
require_relative 'uniqueness'
require_relative 'regularity'

class Byron
  module Grammar
    module Feature
      module Noun
        include Number
        include Uniqueness
        include Regularity
      end
    end
  end
end
