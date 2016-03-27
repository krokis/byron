require_relative '../phrase'
require_relative '../word'
require_relative '../../category/verb'
require_relative '../../feature/voice'
require_relative '../../feature/number'
require_relative '../../feature/person'
require_relative '../../feature/tense'

class Byron
  module Grammar

    ##
    #
    #
    class VerbPhrase < Phrase

      include Category::Verb

      include Feature::Voice
      include Feature::Number
      include Feature::Person
      include Feature::Tense


      def number
        @head && @head.number
      end

    end
    #
    ##

  end
end
