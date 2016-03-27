require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Countable

        include Features

        add_feature :countable, Feature::TRUE_FALSE

        def mass?
          self[:countable]
        end

      end
      #
      ##

    end
  end
end
