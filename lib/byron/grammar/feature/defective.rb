class Byron
  module Grammar
    module Feature

      ##
      # A defective verb is a verb with an incomplete conjugation, or one which
      # cannot be used in some other way as normal verbs can.
      # Defective verbs cannot be conjugated in certain tenses, aspects, or
      # moods.
      #
      # https://en.wikipedia.org/wiki/Defective_verb
      #
      module Defective

        include Features

        add_feature :defective, Feature::TRUE_FALSE

      end
      #
      ##

    end
  end
end
