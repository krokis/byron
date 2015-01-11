require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Number
        include Features
        add_feature :number, [:singular, :plural]
      end
      #
      ##

    end
  end
end
