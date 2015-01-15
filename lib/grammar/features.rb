class Byron
  module Grammar

    ##
    #
    #
    module Features

      def features
        @features ||= {}

        if self.class.superclass && self.class.superclass.respond_to?(:features)
          feats = (self.class.superclass.public_method :features).call
        else
          feats = {}
        end

        feats.merge! @features
      end

      ##
      #
      #
      def [] (feature)
        (defined? @features) && @features[feature]
      end

      ##
      #
      #
      def []= (feature, value)
        @features ||= {}
        @features[feature] = value
      end

      def agrees? (other, features = nil)
        features ||= (self.features.keys & other.features.keys)
        puts "Agrees? #{other}, #{features}"
        puts number, other.number
        features.all? do |name|
          puts self.features[name]
          self.features[name] == other.features[name]
        end
      end

      module ClassMethods
        def add_feature (name, values = [true, false])
          @features ||= {}
          @features[name] = values

          # Getters
          self.class_eval do
            define_method "#{name}".to_sym do
              if @features
                @features[name]
              end
            end

            if ([true, false] & values) == [true, false]
              define_method "#{name}?".to_sym do
                (send name) == true
              end
            else
              values.each do |value|
                define_method "#{value}?".to_sym do
                  (send name) == value
                end
              end
            end
          end
        end
      end

      class << self
        def included (other)
          other.extend ClassMethods
        end
      end
    end
    #
    ##

  end
end
