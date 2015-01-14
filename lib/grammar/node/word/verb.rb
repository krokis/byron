require_relative '../word'
require_relative '../../category/verb'
require_relative '../../feature/regularity'
require_relative '../../feature/defective'

class Byron
  module Grammar

    ##
    #
    #
    class Verb < Word

      include Category::Verb
      include Feature::Regularity
      include Feature::Defective

      self.singleton_class.send :alias_method, :conjugate, :inflect

    end
    #
    ##

  end
end
