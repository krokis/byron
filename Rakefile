require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**{,/*/**}/spec.rb'
  task.rspec_opts = "--format=documentation --color"
end
