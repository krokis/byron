class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Transitivity

        TRANSITIVE   = :transitive
        INTRANSITIVE = :intransitive
        DITRANSITIVE = :ditransitive

        TRANSITIVITIES = [
          TRANSITIVE,
          INTRANSITIVE,
          DITRANSITIVE
        ]

        def transitive?
        end

        def intransitive?
        end

        def ditransitive?
        end

      end
      #
      ##

    end
  end
end
