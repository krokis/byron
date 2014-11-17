class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Number

        SINGULAR = :singular
        PLURAL   = :plural

        @@features[:number] = nil

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
