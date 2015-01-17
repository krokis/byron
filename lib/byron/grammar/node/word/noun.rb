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

      include Category::Noun
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

        def get_singular_form
          @lemma
        end

        def get_plural_form
          "#{get_singular_form}s"
        end

        def get_form (features)
          features.each do |name, value|
            if name == :number
              if value == :singular
                return get_singular_form
              elsif value == :plural
                return get_plural_form
              else
                raise "Oope"
              end
            else
              raise "Oops"
            end
          end
        end

        def get_forms
        end

      end

    end
    #
    ##

  end
end
