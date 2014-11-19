require_relative '../node'
require_relative '../block'
require_relative '../leaf'

class Byron
  module Text

    ##
    #
    #
    class BlockLeaf < Node

      include Block
      include Leaf

    end
    #
    ##

  end
end
