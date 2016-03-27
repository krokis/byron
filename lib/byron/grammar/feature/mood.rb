class Byron
  module Grammar
    module Feature

      ##
      # http://en.wikipedia.org/wiki/Grammatical_mood
      #
      module Mood

        include Features

        add_feature :mood, [
          :indicative,
          :subjunctive,
          :conditional,
          :imperative,
          :interrogative
        ]

        def realis?
          self[:mood] == :indicative
        end

        def irrealis?
          self[:mood] && self[:mood] != :indicative
        end

      end
      #
      ##

    end
  end
end
