require_relative 'argument'
require_relative '../complement'

class Byron
  module Grammar
    class VerbComplement < VerbArgument
      include Complement
    end
  end
end
