require_relative 'node'

class Byron
  module Text

    ##
    #
    #
    module Element

      HTML_TAG_NAME = 'div'

      def can_append_child? (child)
        child.kind_of? Node
      end

      def html_tag_name
        self.class::HTML_TAG_NAME
      end

      def to_html
        tag = html_tag_name

        html = "<#{tag}>"

        children.each do |child|
          html += child.to_html
        end

        html += "</#{tag}>"

        html
      end

      protected :html_tag_name

    end
    #
    ##

  end
end
