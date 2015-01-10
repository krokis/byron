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
      end

      def make_features (tokens)
        if tokens.kind_of? String
          tokens = str.split /[\s\,]+/
        end

        tokens.each do |token|
          features.each do |name, values|
            puts name
          end
          #puts token
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

      def agrees (another, features = nil)
      end

    end
    #
    ##

  end
end
