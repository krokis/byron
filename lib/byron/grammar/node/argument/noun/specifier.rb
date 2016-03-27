require_relative 'argument'
require_relative '../specifier'

class Byron
  module Gramma

    ##
    #
    class NounSpecifier < NounArgument
      include Specifier
    end
    #
    ##

  end
end
