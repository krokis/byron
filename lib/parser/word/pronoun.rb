require_relative '../word'
require_relative '../grammar/node/word/pronoun'

class Byron

  ##
  #
  #
  class PronounParser < WordParser
    PARSES = Grammar::Pronoun
  end
  #
  ##

end
