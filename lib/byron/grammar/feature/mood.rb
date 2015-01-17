class Byron
  module Grammar
    module Feature

      ##
      # http://en.wikipedia.org/wiki/Grammatical_mood
      #
      module Mood

        add_feature :mood, [
          :indicative,
          :subjunctive,
          :conditional,
          :imperative,
          :interrogative
        ]

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
