require_relative '../list'

module Byron
  module Text
    class UnorderedList < List
      attr_accessor :bullet
    end
  end
end
