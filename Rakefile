require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  
  Jeweler::Tasks.new do |gem|
    version = File.exist?('VERSION') ? File.read('VERSION') : ""
      
    gem.name = "rails3-generators"
    gem.summary = %Q{Rails 3 compatible generators}
    gem.description = %Q{Rails 3 compatible generators for DataMapper, Factory-girl, Authlogic, Mongomapper, Mongoid, Shoulda, Formtastic and SimpleForm}
    gem.email = "andre@arko.net"
    gem.homepage = "http://github.com/indirect/rails3-generators"
    gem.authors = ["Jose Valim", "Anuj Dutta", "Paul Berry", "Jeff Tucker", "Louis T.", "Jai-Gouk Kim", "Darcy Laycock", "Peter Haza", "Peter Gumeson", "Kristian Mandrup"]
    # gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.post_install_message =
%Q{
rails3-generators-#{version}
Be sure to check out the wiki, http://wiki.github.com/indirect/rails3-generators/,
for information about recent changes to this project.
  
The Haml generators have moved to {the haml-rails gem}[http://github.com/indirect/haml-rails].
The jQuery generators have moved to {the jquery-rails gem}[http://github.com/indirect/jquery-rails].

}
    
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rails3-generators #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
