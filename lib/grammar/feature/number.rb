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
        #
        def to_singular
        end

        ##
        #
        #
        def to_plural
        end


        ##
        #
        def singular?
          @features[:number] == SINGULAR
        end

        def plural?
          @features[:number] == PLURAL
        end
      end
      #
      ##

    end
  end
end
