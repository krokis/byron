# std-lib
require 'cgi'

class Byron
  module Text

    module Atomic

      attr_accessor :text

      def to_html
        CGI.escapeHTML @text
      end

    end

  end
end
