require_relative '../lexeme'
require_relative '../phrase'
require_relative '../../category/verb'
require_relative '../../feature/voice'

class Byron
  module Grammar

    ##
    #
    #
    class VerbPhrase < Phrase

      include Category::Verb
      include Feature::Voice

      ##
      # Head verb
      #
      def verb
        verb = @head

        while verb
          return verb if verb.kind_of? Lexeme
          verb = verb.head
        end

        verb
      end

    end
    #
    ##

  end
end
