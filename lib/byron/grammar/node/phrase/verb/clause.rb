require_relative '../verb'
require_relative '../../binary'

class Byron
  module Grammar

    ##
    #
    #
    class Clause < VerbPhrase

      include Binary

      alias_method :subject, :argument
      alias_method :predicate, :head

    end
    #
    ##

  end
end
