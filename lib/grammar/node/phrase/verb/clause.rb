require_relative '../verb'
require_relative '../../binary'

class Byron
  module Grammar

    ##
    #
    #
    class Clause < VerbPhrase

      include Binary

      def children
        [subject, predicate].compact
      end

      alias_method :subject, :argument # The head (another VerbPhrase)
      alias_method :predicate, :head # The head (another VerbPhrase)
      alias_method :predicate=, :head= # The head (another VerbPhrase)

    end
    #
    ##

  end
end
