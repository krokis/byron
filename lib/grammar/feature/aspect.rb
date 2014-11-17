# http://en.wikipedia.org/wiki/Grammatical_aspect#English
# https://github.com/rossmeissl/verbs#tenseaspect-quick-reference
# http://en.wikipedia.org/wiki/Habitual_aspect
# http://en.wikipedia.org/wiki/Prospective_aspect

require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      # Aspect expresses how an action (verb) relates to the flow of time.
      #
      module Aspect

        include Features

        SIMPLE              = :simple
        PROGRESSIVE         = :progressive
        PERFECT             = :perfect
        PERFECT_PROGRESSIVE = :perfect_progressive
        HABITUAL            = :habitual
        PROSPECTIVE         = :prospective

        @@features[:aspect] = nil

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
