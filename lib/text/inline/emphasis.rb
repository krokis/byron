require_relative 'element'

module Byron::Text
  attr_accessor :strong?

  class Emphasis < InlineElement
    def initialize
      super
      @strong? = false
    end
  end
end
