require_relative 'features'

class Byron
  module Grammar

    ##
    #
    #
    class Node

      include Features

      @@last_id = 0

      def self.make_id
        "#{(self.name.split '::').last}_#{@@last_id += 1}"
      end

      def initialize (features = {})
        features.each do |name, value|
          self[name] = value
        end
      end

      def id
        @id ||= self.class.make_id
      end

      ##
      #
      #
      def children
        []
      end

      ##
      # Tell if this constituent has any children.
      #
      def children?
        not @children.empty?
      end

      ##
      #
      #
      def walk
        children.each do |child|
          yield child
        end
      end

      ##
      #
      #
      def to_s
        (self.class.name.split '::').last
      end

    end
    #
    ##

  end
end
