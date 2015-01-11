require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Gender

        include Features

        add_feature :gender, [:male, :female]

        def male?
          self[:gender] == :male
        end

        def female?
          self[:gender] == :female
        end

        def neuter?
          self[:gender] == :neuter
        end

      end
      #
      ##
      #

    end
  end
end
