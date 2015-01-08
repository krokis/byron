class Byron
  module Grammar

    ##
    #
    #
    module Features

      class << self

        def add_feature (name, values = [])
          @own_features ||= {}
          @own_features[name] = values
        end

        def features
        end


      @@features = {}

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
        @features = {} unless defined? @features
        @features[feature] = value
      end

      def included (another)
      end

      def agrees (another, features = nil)
      end

      def self.add_feature (name, falues)
      end

    end
    #
    ##

  end
end
