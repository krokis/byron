require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Voice

        include Features

        add_feature :voice, [
          :active,
          :passive
        ]

        def active?
          self[:voice] == :active
        end

        def passive?
          self[:voice] == :passive
        end

      end
      #
      ##

    end
  end
end
