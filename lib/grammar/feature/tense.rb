class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Tense

        PRESENT    = :present
        PAST       = :past
        FUTURE     = :future
        INFINITIVE = :infinitive
        PARTICIPLE = :participle
        GERUND     = :gerund

        TENSES = [
          PRESENT,
          PAST,
          FUTURE,
          INFINITIVE,
          PARTICIPLE,
          GERUND
        ]

        def present?
        end

        def past?
        end

        def future?
        end

        def infinitive?
        end

        def participle?
        end

        def gerund?
        end

        def finitive?
        end

      end
      #
      ##

    end
  end
end
