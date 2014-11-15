require_relative '../word'
require_relative '../category/noun'
require_relative '../feature/uniqueness'
require_relative '../feature/regularity'

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
