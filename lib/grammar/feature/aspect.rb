# http://en.wikipedia.org/wiki/Grammatical_aspect#English
# https://github.com/rossmeissl/verbs#tenseaspect-quick-reference
# http://en.wikipedia.org/wiki/Habitual_aspect
# http://en.wikipedia.org/wiki/Prospective_aspect


class Byron
  module Grammar
    module Feature

      ##
      # Aspect expresses how an action (verb) relates to the flow of time.
      #
      module Aspect

        SIMPLE              = :simple
        PROGRESSIVE         = :progressive
        PERFECT             = :perfect
        PERFECT_PROGRESSIVE = :perfect_progressive
        HABITUAL            = :habitual
        PROSPECTIVE         = :prospective

        ASPECTS = [
          SIMPLE,
          PROGRESSIVE,
          PERFECT,
          PERFECT_PROGRESSIVE
          HABITUAL,
          PROSPECTIVE
        ]

        def simple?
        end

        def progressive?
        end

        def perfect?
        end

        def habitual?
        end

        def prospective?
        end

      end
      #
      ##

    end
  end
end
