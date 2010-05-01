require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rails3-generators"
    gem.summary = %Q{Rails 3 compatible generators}
    gem.description = %Q{Rails 3 compatible generators for DataMapper, Haml, Factory-girl, Authlogic, Mongomapper, and Shoulda}
    gem.email = "andre@arko.net"
    gem.homepage = "http://github.com/indirect/rails3-generators"
    gem.authors = ["Jose Valim", "Anuj Dutta", "Paul Berry", "Jeff Tucker", "Louis T.", "Jai-Gouk Kim", "Darcy Laycock", "Peter Haza"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rails3-generators #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
