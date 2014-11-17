require_relative 'features'
require_relative 'constituent'

class Byron
  module Grammar

    ##
    #
    #
    class Lexeme < Constituent

      attr_reader :lemma

      ##
      # Return a list of unique forms for this lexeme, as strings.
      #
      attr_reader :forms

      def initialize (lemma, features = {}, forms = {})
        @lemma = lemma
        @forms = forms
        make_forms
      end

      ##
      # Add missing forms to @forms
      #
      def make_forms
      end

      def to_s
        @lemma
      end

    end
    #
    ##

  end
end
