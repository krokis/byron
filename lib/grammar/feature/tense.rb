require_relative '../features'

class Byron
  module Grammar
    module Feature

      ##
      #
      #
      module Tense

        include Features

        add_feature :tense, [
          :present,
          :past,
          :future,
          :infinitive,
          :participle,
          :gerund
        ]

        def present?
          self[:tense] == :present
        end

        def past?
          self[:tense] == :past
        end

        def future?
          self[:tense] == :future
        end

        def infinitive?
          self[:tense] == :infinitive
        end

        def participle?
          self[:tense] == :participle
        end

        def gerund?
          self[:tense] == :gerund
        end

        def finitive?
          [:present, :past, :future].include? self[:tense]
        end

      end
      #
      ##

    end
  end
end
