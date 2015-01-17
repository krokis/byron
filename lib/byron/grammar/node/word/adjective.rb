require_relative '../../category/adjective'

class Byron
  module Grammar

    ##
    #
    class Adjective < Word
      include Category::Adjective
    end
    #
    ##

  end
end
