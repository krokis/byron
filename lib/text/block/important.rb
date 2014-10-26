require_relative 'element'
require_relative '../important'

module Byron::Text
  class ImportantBlock < BlockElement
    include Important
  end
end
