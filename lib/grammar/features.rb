class Byron

  module Grammar

    ##
    #
    #
    module Features

      class Features

        ##
        # Kinda borrowed from Rails:
        # http://stackoverflow.com/a/1509939/1966690
        #
        # Ruby on Rails is released under the MIT License.
        #
        def snake_case (str)
          str
            .gsub(/::/, '/')
            .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
            .gsub(/([a-z\d])([A-Z])/,'\1_\2')
            .tr('-', '_')
            .downcase
        end

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

            feat = ((defined? feature::NAME) ?
              feature::NAME : feature.name).to_sym

            @features[feat] = {
              default: nil,
              value: nil
            }

          else
            raise "Cannot redeclare feature '#{feat}'"
          end
        end
        #
        ##

        ##
        # Get default value of feature.
        #
        def default (feat)
          if has feature
            return @features[feat].default
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

      def features
        @features || (@features = @@features.clone)
      end

      ##
      #
      def features
        @features || (@features = @@features.clone)
      end
      #
      ##

      ##
      #
      #
      def self.included (other)
        class << other
          attr_reader :features
          @@features ||= Features.new
        end
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
