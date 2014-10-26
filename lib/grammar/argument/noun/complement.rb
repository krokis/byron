require_relative 'argument'
require_relative '../complement'

class Byron
  module Grammar
    class NounComplement < NounArgument
      include Complement
    end
  end
end
