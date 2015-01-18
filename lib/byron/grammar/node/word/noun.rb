require_relative '../word'
require_relative '../../category/noun'
require_relative '../../feature/number'
require_relative '../../feature/definiteness'
require_relative '../../feature/regularity'
require_relative '../../feature/uniqueness'

class Byron
  module Grammar

    ##
    #
    #
    class Noun < Word

      include Category::Noun,
      include Feature::Regularity
      include Feature::Uniqueness

      def definiteness
        if @head
          if plural? || @head.proper?
            :definite
          else
            :indefinite
          end
        else
          nil
        end
      end

      class << self

        def make_singular_form
          @lemma
        end

        def make_plural_form
          "#{get_singular_form}s"
        end

        def make_form (feats)
          feats.each do |name, value|
            if name == :number
              if value == :singular
                return makesingular_form
              elsif value == :plural
                return make_plural_form
              else
                raise "Oops"
              end
            else
              raise "Oops"
            end
          end
        end

        def all_forms
          forms = {}
          ft = {number: :singular}
          forms[ft] = make_form ft
          ft = {number: :plural}
          forms[ft] = make_form ft
          forms
        end

      end

    end
    #
    ##

  end
end
