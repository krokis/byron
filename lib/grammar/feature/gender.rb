require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Gender

        include Features

        MALE    = :male
        FEMALE  = :female
        NEUTER  = :neuter

        self.add_feature :gender, [:male, :female]

        def male?
        end

        def female?
        end

        def neuter?
        end

      end
      #
      ##
      #

    end
  end
end
