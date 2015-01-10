class Byron
  module Grammar

    ##
    #
    module Binary

      attr_reader :argument

      ##
      # Hey! We need to know which child is on the left and which is on the
      # right.
      #
      def initialize (head, argument, features = {})
        @head = head
        @argument = argument
        super features
      end

      ##
      #
      #
      def children
        [@head, @argument].compact
      end

    end
    #
    ##

  end
end
