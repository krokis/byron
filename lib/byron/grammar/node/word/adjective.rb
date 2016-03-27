require_relative '../../category/adjective'
require_relative '../../feature/comparison'

class Byron
  module Grammar

    ##
    #
    class Adjective < Word

      include Category::Adjective
      include Feature::Comparison

    end
    #
    ##

  end
end
