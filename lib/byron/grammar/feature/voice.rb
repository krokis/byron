require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Voice

        include Features

        add_feature :voice, [
          :active,
          :passive
        ]

      end
      #
      ##

    end
  end
end
