require_relative 'lib/byron'

##
#
#
Gem::Specification.new do |spec|

  spec.name          = 'byron'
  spec.summary       = 'English for machines'
  spec.version       = Byron::VERSION
  spec.authors       = ['Jaume Alemany']
  spec.email         = ['jaume@krokis.com']
  spec.homepage      = 'https://github.com/krokis/byron'
  spec.license       = 'BSD-3-Clause'

  spec.files         = Dir['bin/**/*'] +
                       Dir['lib/**/*'] +
                       Dir['spec/**/*'] +
                       ['Readme.md', 'License']
  spec.require_paths = ['lib']
  spec.executables   = ['bin/byron']
  #spec.testfiles    = []

  # Runtime dependencies
  # s.add_runtime_dependency 'bind-it', '~>0.2.5'

  # Development dependencies.
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
#
##
