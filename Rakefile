require 'rake'
require 'rake/testtask'
require 'rubocop/rake_task'
task :default => 'test:quick'

namespace :test do

  Rubocop::RakeTask.new

  Rake::TestTask.new do |t|
    t.name = :minitest
    t.test_files = Dir.glob('test/spec/**/*_spec.rb')
  end

  desc 'Run all of the quick tests.'
  task :quick do
    Rake::Task['test:minitest'].invoke
    Rake::Task['test:rubocop'].invoke
  end

end
