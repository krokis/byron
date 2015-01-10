module Feats

  def features
    @features ||= {}

    feats = {}

    if self.superclass.respond_to? :features
      feats.merge! (self.superclass.public_method :features).call
    end

    feats.merge! @features
  end

  def add_feature (name, values = [])
    @features ||= {}
    @features[name] = values
  end

  def self.included (other)
    other.extend self
  end

end

class Const
  include Feats
end

class Word < Const
  add_feature 'hey', [1,2]
end

class Noun < Word
end

class Phrase < Const
end

p Word.features
p Noun.features
p Phrase.features

Word.add_feature 'foo', ['bar', 'baz']
Noun.add_feature 'foo2', ['bar2', 'baz2']
Word.add_feature 'foo3', ['bar3', 'baz3']

Phrase.add_feature 'bar', ['baz!!']

p Word.features
p Noun.features
p Phrase.features
