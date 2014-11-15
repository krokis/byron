class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Uniqueness
        PROPER = :proper
        MASS   = :mass

        UNIQUENESSES = [PROPER, MASS]

        def proper?
        end

        def mass?
        end

        alias_method :common, :mass
      end
      #
      ##

    end
  end
end
