require_relative '../list'

class Byron
  module Text
    class OrderedList < List
      attr_accessor :bullet
    end
  end
end
