require_relative 'node'

class Byron
  module Text

    ##
    #
    #
    module Element
      def can_append_child? (child)
        child.kind_of? Node
      end
    end
    #
    ##

  end
end
