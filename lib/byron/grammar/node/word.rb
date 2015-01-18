require_relative 'leaf'

class Byron
  module Grammar

    ##
    # A `Word` represents an inflected form of a lexeme.
    #
    class Word < Leaf

      def lemma
        self.class.lemma
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

        def each_form
          all_forms.each do |form, feats|
            yield form, feats
          end
        end

        alias_method :inflect, :form
      end
    end
    #
    ##

  end
end
