require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      module Person

        include Features

        add_feature :person, [
          :first_person,
          :second_person,
          :third_person,
          :none
        ]

        def personal?
          self[:person] != :none
        end

        def impersonal?
          self[:person] == :none
        end

      end
      #
      ##

    end
  end
end
