require_relative 'leaf'
require_relative 'lexeme'

class Byron
  module Grammar

    ##
    # A `Word` represents an inflected form of a lexeme.
    #
    # This should inherit features from its lexeme. If `regularity` is a feature
    # of verbal lexemes and `tense` if of words's, then we should be able to do:
    #
    #     to_be = VerbLexeme.new 'be'
    #     to_be.regular? # false
    #     i_am = to_be.inflect person: first, number: singular, tense: present
    #     i_am.present? # true
    #     i_am.regular? # false, same as i_am.lexeme.regular?
    #
    class Word < Leaf

      # Should lexemes be read only?
      attr_reader :lexeme

      def lemma
        # Should lexeme be mandatory?
        @lexeme ? @lexeme.lemma : nil
      end

      def initialize (lexeme = nil, features = nil)
        # Should lexeme be mandatory?
        @lexeme = lexeme
      end

      def inflect (features)
        # Call @lexeme.inflect
      end

      def self.inherited (subclass)
        # Inherit lexeme features here?
      end

      def to_s
      end
    end
    #
    ##

  end
end
