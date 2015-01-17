class Byron
  module Grammar

    ##
    #
    #
    module Feature

      def self.included (other)
        puts "Self: #{self} other: #{other}"
      end

    end
    #
    ##

  end
end
