require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Uniqueness

        include Features

        add_feature :uniqueness, [
          :proper,
          :common
        ]

      end
      #
      ##

    end
  end
end
