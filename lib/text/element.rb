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
    ## module Element

  end
end
