require './lib/byron'

##
#
#
Gem::Specification.new do |spec|

  spec.name          = 'byron'
  spec.summary       = 'English for machines'
  spec.version       = Byron::VERSION
  spec.authors       = ['Jaume Alemany']
  spec.email         = ['jaume@krokis.com']
  spec.homepage      = 'https://byron.krokis.com'
  spec.license       = 'BSD-3-Clause'

  spec.files         = Dir['bin/**/*'] +
                       Dir['lib/**/*'] +
                       Dir['spec/**/*'] +
                       ['Readme.md', 'License']
  spec.require_paths = ['lib']
  spec.executables   = ['bin/byron']
  #spec.testfiles    = []

  # Runtime dependencies

  # Development dependencies.
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack', '~> 1.5.2'
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'slim'

end
#
##
