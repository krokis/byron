require_relative 'important'

module Byron::Text
  class MoreImportantSpan < ImportantSpan
    include Important
  end
end
