require_relative 'grammar/node/sentence'

class Byron

  ##
  #
  class Discourse

    ##
    # Array of `Grammar::Sentence`s this `Discourse` is made of.
    #
    attr_accessor :sentences

    ##
    # Original or generated discourse text.
    #
    def text
    end

    ##
    #
    #
    def initialize
      @sentences = []
    end

  end
  #
  ##

end
