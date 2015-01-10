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

        unless period || end_of_block? || !important?
            raise 'Unterminated sentence' # Try again
          end
        yield (Grammar::Sentence.new clause)
      end
    end

  end
  #
  ##

end
