# http://en.wikipedia.org/wiki/Gender

require_relative '../feature/transitivity'

class Byron
  module Grammar
    module Category

      ##
      #
      #
      module Verb
        include Feature::Transitivity
      end
      #
      ##

    end
  end
end
