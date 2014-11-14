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
      attr_reader :forms

      def initialize (category, lemma, features, forms)
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
