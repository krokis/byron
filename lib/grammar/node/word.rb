require_relative 'branch'
require_relative 'unary'

class Byron
  module Grammar

    ##
    # A `Word` represents an inflected form of a lexeme.
    #
    class Word < Branch

      include Unary

      def lexeme
        @head
      end

      def lemma
        @head && @head.lemma
      end

      def inflect (features)
        # Call @lexeme.inflect
      end
    end
    #
    ##

  end
end
