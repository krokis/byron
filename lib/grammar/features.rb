class Byron

  module Grammar

    ##
    #
    #
    module Features

      class Features

        ##
        #
        def has (feature)
          @features && (@features.has_key? feature)
        end
        #
        ##

        ##
        #
        def get (feature)
          if has feature
            @features[feature][:value]
          else
            raise "Unknown feature: '#{feature}'"
          end
        end
        #
        ##

        ##
        # Set feature value.
        #
        def set (feature, value)
          if has feature
            if feature::VALUES.include? value
              @features[feature].value = value
            else
              raise "Bad value for feature '#{feature}': '#{value}'"
            end
          else
            raise "Unknown feature: '#{feature}'"
          end
        end

        ##
        #
        #
        def [] (feature)
          get feature
        end
        #
        ##

        ##
        #
        #
        def []= (feature, value)
          set feature, value
        end
        #
        ##

        ##
        #
        #
        def add (feature)
          unless has feature
            @features ||= {}

            @features[feature] = {
              default: nil,
              value: nil
            }
          else
            raise "Cannot redeclare feature '#{feature}'"
          end
        end
        #
        ##

        ##
        # Get default value of feature.
        #
        def default (feature)
          if has feature
            return @features[features].default
          end

          raise "Unknown feature: '#{feature}'"
        end
        #
        ##

        ##
        # Set feature default value.
        #
        def default! (feature, value)
          if has feature
            if feature::VALUES.include? value
              @features[feature].default = value
            else
              raise "Bad default value for feature '#{feature}': '#{value}'"
            end
          else
            raise "Unknown feature: '#{feature}'"
          end
        end
        #
        ##

      end
      #
      ## class Byron::Grammar:Features::Features

      def init_features
        @features = @@features.clone
      end

      def features
        @features || init_features
      end

      ##
      #
      #
      def self.included (other)
        other.features ||= Features.new
      end
      #
      ##

    end
    #
    ## class Byron::Grammar::Features

  end
  #
  ## module Byron::Grammar

end
#
## module Byron
