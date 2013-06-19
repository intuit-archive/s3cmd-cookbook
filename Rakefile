require 'foodcritic'
require 'rspec/core/rake_task'

FoodCritic::Rake::LintTask.new do |t|
  t.options = { :fail_tags => ['any'] }
end

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w(--color)
end

task :default => [:foodcritic, :spec]
