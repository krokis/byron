require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Countable

        include Features

        add_feature :countable, [true, false]

        def mass?
          self[:countable] == false
        end

      end
      #
      ##

    end
  end
end
