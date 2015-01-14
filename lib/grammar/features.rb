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

      def add_feature (name, values = [])
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

      def make_features (tokens)
        if tokens.kind_of? String
          tokens = str.split /[\s\,]+/
        end

        tokens.each do |token|
          features.each do |name, values|
            puts name
          end
        end
      end

      def self.included (other)
        other.extend self
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

      def agrees? (another, features = nil)
        features ||= (self.features.keys & another.features.keys)
        features.all? do |name|
          self.features[name] == other.features[name]
        end
      end

    end
    #
    ##

  end
end
