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
    class Noun < Word

      include Category::Noun

      include Feature::Number
      include Feature::Definiteness

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

    end
    #
    ##

  end
end
