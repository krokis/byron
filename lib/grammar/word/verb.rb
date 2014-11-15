require_relative '../word'
require_relative '../category/verb'
require_relative '../feature/person'
require_relative '../feature/number'
require_relative '../feature/tense'
require_relative '../feature/aspect'

class Byron
  module Grammar

    ##
    #
    #
    class Verb < Word

      include Category::Verb
      include Feature::Person
      include Feature::Number
      include Feature::Tense
      include Feature::Aspect

      def self.inherited (other)
      end

      alias_method :conjugate, :inflect
    end
    #
    ##

  end
end
