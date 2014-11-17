require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Countable

        include Features

        @@features[:countable] = false

        def countable?
        end

        def mass?
        end

      end
      #
      ##

    end
  end
end
