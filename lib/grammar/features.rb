class Byron
  module Grammar

    ##
    #
    #
    module Features

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

    end
    #
    ##

  end
end
