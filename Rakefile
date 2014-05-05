require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

namespace :generate do
  require File.expand_path('../lib/cocoatalk/generator', __FILE__)
  task :default do
    options = {output: 'output', input: 'test/files/test-schema.rb'}
    Generator::Generator.new.generate(options)
  end

  task :gen, :input, :output do |t, args|
    Generator::Generator.new.generate(args)
  end
end

task :generate => ["generate:default"]
task :default => :test
