require_relative '../main'
require_relative '../../../../../grammar/node/phrase/verb/clause/main/declarative'
require_relative '../../../../../grammar/node/argument/verb/subject'
require_relative '../../../../../grammar/node/phrase/verb/predicate'

class Byron

  ##
  #
  #
  class DeclarativeClauseParser < MainClauseParser

    PARSES = Grammar::DeclarativeClause

    def parse
      parse_a Grammar::Subject do |subject|
        parse_a Grammar::Predicate do |predicate|
          yield (Grammar::DeclarativeClause.new predicate, subject)
        end
      end
    end

  end
  #
  ##

end

