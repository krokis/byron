require_relative 'delegate'
require_relative '../grammar/node/sentence'
require_relative '../grammar/node/sentence'
require_relative '../grammar/node/phrase/verb/clause/main'

class Byron

  ##
  #
  class SentenceParser < ParserDelegate

    PARSES = Grammar::Sentence

    def parse
      parse_a Grammar::MainClause do |clause|
        period =
          begin
            parse_a Grammar::Period
          rescue
            nil
          end

        if period || end_of_block? || !important?
          yield (Grammar::Sentence.new clause)
        end
      end
    end

  end
  #
  ##

end
