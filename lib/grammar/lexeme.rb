require_relative 'features'
require_relative 'constituent'

class Byron
  module Grammar

    ##
    #
    #
    class Lexeme < Constituent

      attr_reader :category
      attr_reader :lemma

      ##
      # Return a list of unique forms for this lexeme, as strings.
      def forms
      end

      def initialize (lemma, features)
        @lemma = lemma
      end

      def to_s
        @lemma
      end
    end
    #
    ##

  end
end
