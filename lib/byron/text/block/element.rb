require_relative '../node'
require_relative '../block'
require_relative '../element'

class Byron
  module Text

    ##
    #
    #
    class BlockElement < Node
      include Block
      include Element
    end
    #
    ## class BlockElement

  end
end
