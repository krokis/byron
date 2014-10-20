require '../../inline'
require '../../atomic'

module Byron
  module Text
    class Literal < Inline
      include Atomic
    end
  end
end
