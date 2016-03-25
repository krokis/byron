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

      def form (features)
        @head && @head.form features
      end

      alias_method :inflect, :form

    end
    #
    ##

  end
end
