require_relative '../node'
require_relative '../inline'
require_relative '../atomic'

class Byron
  module Text

    ##
    #
    #
    class InlineAtomic < Node
      include Inline
      include Atomic
    end
    #
    ## class InlineAtomic

  end
end
