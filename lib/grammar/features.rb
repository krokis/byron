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

    end
    #
    ##

  end
end
