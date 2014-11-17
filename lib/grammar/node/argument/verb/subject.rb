require_relative 'specifier'
require_relative '../../../category/noun'

class Byron
  module Grammar
    class Subject < VerbSpecifier
      include Category::Noun
    end
  end
end
