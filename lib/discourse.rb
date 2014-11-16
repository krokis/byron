class Byron

  ##
  #
  class Discourse

    ##
    # Array of `Text::Sentence`s this `Discourse` is made of.
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

end
