require_relative '../verb'
require_relative '../../unary'

class Byron
  module Grammar

    ##
    #
    #
    class SimpleVerbPhrase < VerbPhrase

      include Unary

      alias_method :verb, :head

    end
    #
    ##

  end
end
