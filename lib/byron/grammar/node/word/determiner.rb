require_relative '../word'
require_relative '../../category/determiner'

class Byron
  module Grammar

    ##
    #
    class Determiner < Word

      include Category::Determiner

    end
    #
    ##

  end
end
