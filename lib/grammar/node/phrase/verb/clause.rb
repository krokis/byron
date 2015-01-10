require_relative '../verb'
require_relative '../../binary'

class Byron
  module Grammar

    ##
    #
    #
    class Clause < VerbPhrase

      include Binary

      attr_accessor :subject # The specifier
      attr_accessor :predicate # The head (another VerbPhrase)
    end
    #
    ##

  end
end
