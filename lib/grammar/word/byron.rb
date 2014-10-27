require_relative '../feature/uniqueness'
require_relative 'noun'

class Byron
  module Grammar
    class Byron < Noun
      feature Feature::Uniqueness::COMMON
    end
  end
end
