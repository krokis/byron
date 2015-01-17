require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Regularity

        include Features

        add_feature :regularity, [
          :regular,
          :irregular
        ]

      end
      #
      ##

    end
  end
end
