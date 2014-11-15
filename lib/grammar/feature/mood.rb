class Byron
  module Grammar
    module Feature

      ##
      # http://en.wikipedia.org/wiki/Grammatical_mood
      #
      module Mood

        INDICATIVE    = :indicative
        SUBJUNCTIVE   = :subjunctive
        CONDITIONAL   = :conditional
        IMPERATIVE    = :imperative
        INTERROGATIVE = :interrogative

        MOODS = [
          INDICATIVE,
          SUBJUNCTIVE,
          CONDITIONAL,
          IMPERATIVE,
          INTERROGATIVE
        ]

        def indicative?
        end

        def subjunctive?
        end

        def conditional?
        end

        def imperative?
        end

        def interrogative?
        end

        def realis?
        end

        def irrealis?
        end

      end
      #
      ##

    end
  end
end
