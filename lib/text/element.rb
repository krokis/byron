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

      def html_tag_name
        'div'
      end

      def html_tag (name)
      end

      def html_empty_tag (name)
      end

      def to_html
      end

      protected :html_tag_name

    end
    #
    ##

  end
end
