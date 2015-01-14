require_relative '../word'
require_relative '../../category/noun'
require_relative '../../feature/number'
require_relative '../../feature/definiteness'

class Byron
  module Grammar

    ##
    #
    #
    class Noun < Word

      include Category::Noun
      include Feature::Number
      include Feature::Definiteness

      def definiteness
        if @head
          if @head.proper? && singular?
            :definite
          else
            :indefinite
          end
        else
          nil
        end
      end

    end
    #
    ##

  end
end
