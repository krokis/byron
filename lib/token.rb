class Byron

  ##
  #
  #
  class Token

    attr_accessor :value
    attr_accessor :start
    attr_accessor :stop

    def initialize (value = nil, start = nil, stop = nil)
      @value = value
      @start = start
      @stop = stop
    end

  end
  #
  ## class Token

end
