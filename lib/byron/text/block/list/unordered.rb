require_relative '../list'

module Byron::Text

  ##
  #
  #
  class UnorderedList < List

    HTML_TAG_NAME = 'ul'

    attr_accessor :bullet

  end
  #
  ##

end
