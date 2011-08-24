require 'bundler'
require 'rspec/core/rake_task'

require 'cucumber'
require 'cucumber/rake/task'

task :default => [:spec]

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern    = FileList['spec/**/*_spec.rb']
  t.rspec_opts = %w(-fp --color)
end

desc "Run Cucumber feature tests"
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty" # Any valid command line option can go here.
end
