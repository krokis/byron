require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Transitivity

        include Features

        add_feature :transitivity, [
          :transitive,
          :intransitive,
          :ditransitive,
          :linking
        ]

      end
      #
      ##

    end
  end
end
