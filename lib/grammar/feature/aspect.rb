# http://en.wikipedia.org/wiki/Grammatical_aspect#English

class Byron
  module Grammar
    module Feature

      module Aspect

        PRESENT_SIMPLE      = :present_simple
        PRESENT_PROGRESSIVE = :present_progressive
        # ...

        VALUES = [
          PRESENT_SIMPLE,
          PRESENT_PROGRESSIVE,
          #...
        ]
      end

    end
  end
end
