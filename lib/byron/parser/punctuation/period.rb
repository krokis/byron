require_relative '../../grammar/node/punctuation/period'
require_relative '../punctuation'

class Byron

  ##
  #
  #
  class PeriodParser < PunctuationParser
    PARSES = Grammar::Period
  end
  #
  ##

end
