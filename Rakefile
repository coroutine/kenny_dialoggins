require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'jeweler'


desc 'Default: run tests.'
task :default => [:test]


desc 'Test the plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end


desc 'Generate documentation for the plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'kenny_dialoggins'
  rdoc.options << '--line-numbers --inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


begin
  Jeweler::Tasks.new do |gemspec|
    gemspec.authors           = ["Coroutine", "Tim Lowrimore"]
    gemspec.description       = "Kenny Dialoggins allows you to include scriptaculous dialogs in Rails applications using the same syntax employed for rendering partials."
    gemspec.email             = "@coroutine.com"
    gemspec.homepage          = "http://github.com/coroutine/kenny_dialoggins"
    gemspec.name              = "kenny_dialoggins"
    gemspec.summary           = "Dead simple, beautiful dialogs for Rails."
    
    gemspec.add_dependency("actionpack")
    gemspec.files.include("lib/**/*.rb")
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end


