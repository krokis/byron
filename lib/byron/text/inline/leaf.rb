require_relative '../node'
require_relative '../inline'
require_relative '../leaf'

class Byron
  module Text

    ##
    #
    #
    class InlineLeaf < Node
      include Inline
      include Leaf
    end
    #
    ##

  end
end
