require_relative '../inline'
require_relative '../atomic'

module Byron
  module Text
    class Character < Inline
      include Atomic
    end
  end
end
