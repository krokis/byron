require '../category/noun'
require '../word'

module Byron
  module Syntax
    class Noun < Word
      include Category::NOUN
    end
  end
end
