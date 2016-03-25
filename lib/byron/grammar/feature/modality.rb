# http://en.wikipedia.org/wiki/Auxiliary_verb#Auxiliary_verbs_in_English

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Modality

        include Features

        add_feature :modality, [
          :epistemic,
          :deontic,
          :dynamic,
          :progressive,
          :passive,
          :perfect,
          :emphasis
        ]

      end
      #
      ##

    end
  end
end
