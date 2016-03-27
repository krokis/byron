require_relative '../noun'
require_relative '../../unary'

class Byron
  module Grammar

    ##
    #
    #
    class SimpleNounPhrase < NounPhrase

      include Unary

    end
    #
    ##

  end
end
