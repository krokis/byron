# http://en.wikipedia.org/wiki/Grammatical_aspect#English

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Aspect
        SIMPLE              = :simple
        PROGRESSIVE         = :progressive
        PERFECT             = :perfect
        PERFECT_PROGRESSIVE = :perfect_progressive
        # ...

        ASPECTS = [
          SIMPLE,
          PROGRESSIVE,
          PERFECT,
          PERFECT_PROGRESSIVE
        ]

        def simple?
        end

        def progressive?
        end

        def perfect?
        end

      end
      #
      ##

    end
  end
end
