require_relative 'branch'
require_relative 'unary'

class Byron
  module Grammar

    ##
    #
    #
    class Argument < Branch
      include Unary
    end
    #
    ##

  end
end
