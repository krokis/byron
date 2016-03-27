require_relative '../word'
require_relative '../../category/prepositional'

class Byron
  module Grammar

    ##
    #
    #
    class Preposition < Word

      include Category::Prepositional

    end
    #
    ##

  end
end
