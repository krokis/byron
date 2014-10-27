require_relative '../word'
require_relative '../category/verb'
require_relative '../feature/regularity'

class Byron
  module Grammar

    ##
    #
    #
    class Verb < Word
      include Category::Verb
      include Feature::Regularity

      def self.inherited (other)

      end

    end
    #
    ## class Byron::Grammar::Verb

  end
end
