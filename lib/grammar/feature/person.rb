class Byron
  module Grammar
    module Feature

      ##
      #
      module Person

        FIRST      = :first
        SECOND     = :second
        THIRD      = :third
        NONE       = :none
        IMPERSONAL = NONE

        PERSONS = [
          FIRST,
          SECOND,
          NONE
        ]

        def first_person?
        end

        def second_person?
        end

        def third_person?
        end

        def personal?
        end

        def impersonal?
        end

      end
      #
      ##

    end
  end
end
