require_relative '../node'
require_relative '../inline'
require_relative '../element'

class Byron
  module Text

    ##
    #
    #
    class InlineElement < Node
      include Inline
      include Element

      ##
      #
      #
      def can_append_child? (child)
        # Cannot append a non-inline child to an inline node.
        child.kind_of? Inline
      end

    end
    #
    ## class InlineElement

  end
end
