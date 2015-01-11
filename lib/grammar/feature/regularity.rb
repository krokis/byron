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


        def regular?
          self[:regularity] == :regular
        end

        def irregular?
          self[:regularity] == :irregular
        end

      end
      #
      ##

    end
  end
end
