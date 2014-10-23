require_relative '../inline'
require_relative '../atomic'

module Byron::Text
  class Character < Inline
    include Atomic
  end
end
