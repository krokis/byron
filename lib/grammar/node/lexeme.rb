require_relative 'leaf'

class Byron
  module Grammar

    ##
    #
    #
    class Lexeme < Leaf

      attr_reader :lemma

      ##
      # Return a list of unique forms for this lexeme, as strings.
      #
      attr_reader :forms

      def initialize (features = {}, lemma = nil, forms = {})
        @lemma = lemma
        @forms = forms
        make_forms
        super features
      end

      ##
      # Add missing forms to @forms
      #
      def make_forms
      end

      def to_s
        "[Lexeme \"#{@lemma}\"]"
      end

      protected :make_forms

    end
    #
    ##

  end
end
