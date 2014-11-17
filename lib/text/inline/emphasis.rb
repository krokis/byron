require_relative 'element'

module Byron::Text
  attr_accessor :strong

  class Emphasis < InlineElement
    def initialize
      super
      @strong = false
    end
  end

  alias_method :strong?, :strong
end
