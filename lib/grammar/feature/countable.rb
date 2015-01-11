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

        def countable?
          self[:countable] == true
        end

        def mass?
          self[:countable] == false
        end

      end
      #
      ##

    end
  end
end
