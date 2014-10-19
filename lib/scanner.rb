module Byron
  class Scanner
    def initialize
      @prepare
    end

    def prepare (text = nil)
      @text = text
      @position = 0
      @line = 0
      @column = 0
      @section = nil
      @length = @text.length
    end
  end
end
