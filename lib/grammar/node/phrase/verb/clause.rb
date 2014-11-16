require_relative '../verb'

class Byron
  module Grammar

    ##
    #
    #
    class Clause < VerbPhrase
      attr_accessor :subject # The specifier
      attr_accessor :predicate # The head (another VerbPhrase)
    end
    #
    ##

  end
end
