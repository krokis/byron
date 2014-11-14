require_relative 'features'
require_relative 'constituent'

class Byron
  module Grammar

    ##
    #
    #
    class Lexeme < Constituent

      attr_reader :lemma

      def initialize (lemma, forms)
        @lemma = lemma
      end

      def to_s
        @@LEMMA
      end
    end
    #
    ##

  end
end
