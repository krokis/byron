require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**{,/*/**}/spec.rb'
  t.rspec_opts = "--format=documentation --color"
end
