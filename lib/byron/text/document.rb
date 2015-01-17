require_relative 'node'

class Byron
  module Text

    ##
    #
    #
    class Document < Node

      attr_accessor :meta

      attr_accessor :body

      def to_html
        html  = '<!DOCTYPE html><html>'
        html += '<head></head>'
        html += '<body>'

        @body.children.each do |child|
          html += child.to_html
        end

        html += '</body>'
      end

    end
    #
    ##

  end
end
