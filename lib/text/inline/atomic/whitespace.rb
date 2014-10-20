require_relative '../../inline'
require_relative '../../atomic'

module Byron
  module Text
    class Whitespace < Inline
      include Atomic
    end
  end
end
