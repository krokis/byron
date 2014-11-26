require_relative 'branch'
require_relative 'unary'

class Byron

  module Grammar

    ##
    # The `Sentence` class represents a complete sentence and, as so, it should:
    #
    # 1) Contain a simple or compound independent clause.
    # 2) Start with a capitalized letter.
    # 3) End with a period, ellipsis or an interrogation or exclamation mark.
    #
    class Sentence < Branch
      include Unary
    end

  end

end
