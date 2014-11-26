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
        LINKING      = :linking

        TRANSITIVITIES = [
          TRANSITIVE,
          INTRANSITIVE,
          DITRANSITIVE,
          LINKING
        ]

        def transitive?
        end

        def intransitive?
        end

        def ditransitive?
        end

        def linking?
        end

      end
      #
      ##

    end
  end
end
