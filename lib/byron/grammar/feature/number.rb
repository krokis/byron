require_relative '../feature'
require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Number
        include Features

        NAME   = :number
        VALUES = [:singular, :plural]

        add_feature :number, [:singular, :plural]

      end
      #
      ##

    end
  end
end
