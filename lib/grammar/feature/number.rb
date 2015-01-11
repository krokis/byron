require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Number

        include Features

        add_feature :number, [:singular, :plural]

        ##
        #
        def singular?
          self[:number] == :singular
        end

        def plural?
          self[:number] == :plural
        end
      end
      #
      ##

    end
  end
end
