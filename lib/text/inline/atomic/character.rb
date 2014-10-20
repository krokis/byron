require '../../inline'
require '../../atomic'

module Byron
  module Text
    class Character < Inline
      include Atomic
    end
  end
end
