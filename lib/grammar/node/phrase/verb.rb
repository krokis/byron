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
        verb = self

        while verb

          return verb if verb.kind_of? Lexeme

          begin
            verb = verb.head
          rescue Exception => e
            puts "Verb has no head!!! #{self}, #{verb}, #{self.head}"
            raise e
          end
        end

        nil
      end

    end
    #
    ##

  end
end
