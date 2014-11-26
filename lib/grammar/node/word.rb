require_relative 'branch'
require_relative 'unary'

class Byron
  module Grammar

    ##
    # A `Word` represents an inflected form of a lexeme.
    #
    # This should inherit features from its lexeme. If `regularity` is a feature
    # of verb lexemes and `tense` if of words's, then we should be able to do:
    #
    #     to_be = VerbLexeme.new 'be'
    #     to_be.regular? # false
    #     i_am = to_be.inflect person: first, number: singular, tense: present
    #     i_am.present? # true
    #     i_am.regular? # false, same as i_am.lexeme.regular?
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

      def to_s
      end
    end
    #
    ##

  end
end
