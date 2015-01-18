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

        def make_form (features)
          @lemma
        end

        def form (features)
          @forms ||= {}
          @forms[features] ||= make_form features
        end

        def add_form (form, features)
          @forms ||= {}
          @forms[features] ||= form
        end

        def all_forms
          raise "Oops"
        end

        alias_method :inflect, :form
      end
    end
    #
    ##

  end
end
