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
      end

    end
    #
    ##

  end
end
