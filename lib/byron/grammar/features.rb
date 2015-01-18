class Byron
  module Grammar

    ##
    #
    #
    module Features

      def features
        if self.class.superclass && self.class.superclass.respond_to?(:features)
          feats = self.class.superclass.features
        else
          feats = {}
        end
        @features ||= self.class.default_features
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
        @features ||= self.class.default_features
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
        def add_feature (name, values = [true, false], default = nil)
          @features ||= {}
          @features[name] = [values, default]

          # Accessors
          define_method "#{name}".to_sym do
            if @features
              @features[name]
            end
          end

          define_method "#{name}=".to_sym do
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

        def features
          (defined? @features) ? @features : {}
        end

        def feature (name)
          if defined? @features
            @features[name]
          elsif self.superclass.respond_to? :feature
            self.superclass.feature name
          else
            raise "Unknown feature for class #{self} '#{name}'"
          end
        end

        def has_feature? (name)
          begin
            feature name
            true
          rescue
            false
          end
        end

        def default_features
          feats = {}

          if defined? @features
            @features.each do |name, d|
              feats[name] = d[1]
            end
          end

          feats
        end

        ##
        # Get default feature value.
        #
        def [] (name)
          (feature name)[1]
        end

        ##
        # Set default feature value.
        #
        def []= (name, value)
          feat = feature name

          unless feat[0].include? value
            raise "Bad value for feature '#{name}': #{value}"
          end

          @features[name] ||=

          @features[feature][1] = value
        end

        def inherited (other)
          #puts "#{self} inherited on #{other}"
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
