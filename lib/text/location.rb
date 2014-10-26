class Byron

  module Text

    ##
    #
    #
    Location = Struct.new :position, :line, :column do

      ##
      # Sets default values.
      #
      def initialize (*)
        super

        self.position ||= 0
        self.line     ||= 1
        self.column   ||= 0
      end
      #
      ##

    end
    #
    ## class Byron::Text:Location

  end
  #
  ## module Byron::Text

end
#
## class Byron
