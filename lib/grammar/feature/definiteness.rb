require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      module Definiteness

        include Features

        add_feature :definiteness, [
          :definite,
          :indefinite
        ]

      end
      #
      ##

    end
  end
end

