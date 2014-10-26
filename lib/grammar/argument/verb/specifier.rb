require_relative 'argument'
require_relative '../specifier'

class Byron
  module Grammar
    class VerbSpecifier < VerbArgument
      include Specifier
    end
  end
end
