require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Tense

        include Features

        add_feature :tense, [
          :present,
          :past,
          :future,
          :infinitive,
          :participle,
          :gerund
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
