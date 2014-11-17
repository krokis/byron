require_relative '../word'
require_relative '../../category/noun'
require_relative '../../feature/number'

class Byron
  module Grammar

    ##
    #
    #
    class Noun < Word
      include Category::Noun
      include Feature::Number
    end
    #
    ##

  end
end
