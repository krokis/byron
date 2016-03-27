require_relative '../lexeme'
require_relative '../../category/verb'
require_relative '../../feature/regularity'
require_relative '../../feature/transitivity'
require_relative '../../feature/defective'

class Byron
  module Grammar

    ##
    #
    class VerbLexeme < Lexeme

      include Category::Verb

      include Feature::Regularity
      include Feature::Transitivity
      include Feature::Defective

      def make_s_form
        "#{@lemma}s"
      end

      def make_ing_form
        "#{@lemma}ing"
      end

      def make_participle_form
        "#{@lemma}ed"
      end

      def make_present_form (features)
        if features[:number] == :singular &&
           features[:person] == third_person
          make_s_form
        else
          @lemma
        end
      end

      def make_form (features)
        case features[:tense]
          when :present
            make_present_form features
          when :past, :participle
            make_participle_form features
          when :infinitive
            @lemma
          when :gerund
            make_ing_form
          when
            make_participle_form
        end
      end

      protected     :make_s_form,
                    :make_ing_form,
                    :make_participle_form,
                    :make_present_form,
                    :make_past_form

      alias_method  :conjugate, :inflect

    end
    #
    ##

  end
end
