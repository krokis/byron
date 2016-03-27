require_relative 'leaf'

class Byron
  module Grammar

    ##
    #
    class Lexeme < Leaf

      attr_reader :lemma

      def initialize (features = {}, lemma = nil, forms = {})
        @lemma = lemma
        @forms = forms

        super features
      end

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

      def make_forms
        raise 'not implemented'
      end

      def to_s
        @lemma
      end

      protected     :make_form

      alias_method  :inflect, :form
      alias_method  :forms, :make_forms

    end
    #
    ##

  end
end
