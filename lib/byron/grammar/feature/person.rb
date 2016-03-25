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
          :impersonal
        ]

        def personal?
          not impersonal?
        end

      end
      #
      ##

    end
  end
end
