require_relative 'element'
require_relative '../important'

module Byron::Text
  class ImportantSpan < InlineElement
    include Important
  end
end
