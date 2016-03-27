require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Gender

        include Features

        add_feature :gender, [
          :male,
          :female,
          :neuter
        ]

      end
      #
      ##
      #

    end
  end
end
