require_relative 'branch'
require_relative 'ternary'

class Byron
  module Grammar

    ##
    #
    class Coordination < Branch
      include Ternary
    end
    #
    ##

  end
end
