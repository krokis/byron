require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Transitivity

        include Features

        add_feature :transitivity, [
          :transitive,
          :intransitive,
          :ditransitive,
          :linking
        ]

        def transitive?
          self[:transitivity] == :transitive
        end

        def intransitive?
          self[:transitivity] == :intransitive
        end

        def ditransitive?
          self[:transitivity] == :ditransitive
        end

        def linking?
          self[:transitivity] == :linking
        end

      end
      #
      ##

    end
  end
end
