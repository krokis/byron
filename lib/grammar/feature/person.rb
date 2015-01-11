require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      module Person

        include Features

        add_feature :person, [
          :first,
          :second,
          :third,
          :none
        ]

        def first_person?
          self[:person] == :fist_person
        end

        def second_person?
          self[:person] == :second_person
        end

        def third_person?
          self[:person] == :third_person
        end

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
