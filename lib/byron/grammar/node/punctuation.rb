require_relative 'branch'
require_relative 'leaf'

class Byron
  module Grammar

    ##
    #
    #
    class Punctuation < Leaf

      FORMS = []

      def self.forms
        self::FORMS
      end

    end
    #
    ##

  end
end
