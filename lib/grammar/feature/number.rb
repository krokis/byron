class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Number

        SINGULAR = 1
        PLURAL   = 2

        VALUES = [SINGULAR, PLURAL]

        def self.make_singular
          raise ':('
        end

        def self.make_plural
          raise ':('
        end

        def to_singular
          @@make_singular
        end

        def to_plural
          @@make_plural
        end

        def singular?
          @features[Number] == Number::SINGULAR
        end

        def plural?
          @features[Number] == Number::PLURAL
        end

        def included (other)
          other.features.add Number
          other.make_singular = self.make_singular
          other.make_plural = self.make_plural
        end

      end
      #
      ##

    end
  end
end
