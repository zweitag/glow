#!/usr/bin/env rake
require 'bundler'
require 'rdoc/task'
require 'rspec/core/rake_task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Glow'
  rdoc.options << '--line-numbers'
  #rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

desc "Default Task"
task :default => :spec

Bundler::GemHelper.install_tasks

