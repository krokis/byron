class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Uniqueness

        add_feature :uniqueness, [
          :proper,
          :common
        ]

        def proper?
          self[:uniqueness] == :proper
        end

        def common?
          self[:uniqueness] == :common
        end

      end
      #
      ##

    end
  end
end
