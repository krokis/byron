class Byron
  module Grammar

    ##
    #
    #
    module Feature

      TRUE_FALSE = [true, false].freeze

      def self.included (other)
        puts "Self: #{self} other: #{other}"
      end

    end
    #
    ##

  end
end
