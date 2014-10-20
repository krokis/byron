require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = "--format=documentation --color spec/**{,/*/**}/spec.rb"
end
