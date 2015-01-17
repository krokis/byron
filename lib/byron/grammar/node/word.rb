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

      class << self
        attr_accessor :lemma

        def get_form (features)
        end

        def set_form (form, features)
        end

        def get_forms
        end

        def inflect (features)
        end

      end
    end
    #
    ##

  end
end
