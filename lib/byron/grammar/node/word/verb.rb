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

      class << self
        def get_s_form
        end

        def get_ing_form
        end

        def get_form (features)
        end

        def get_forms
        end
      end

      self.singleton_class.send :alias_method, :conjugate, :inflect

    end
    #
    ##

  end
end
