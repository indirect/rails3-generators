# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails3-generators/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'rails3-generators'
  s.version = Rails3::Generators::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors = ["Jose Valim", "Anuj Dutta", "Paul Berry", "Jeff Tucker", "Louis T.", "Jai-Gouk Kim", "Darcy Laycock", "Peter Haza", "Peter Gumeson", "Kristian Mandrup", "Alejandro Juarez"]
  s.email = 'andre@arko.net'
  s.homepage = 'https://github.com/indirect/rails3-generators'
  s.summary = 'Rails 3 compatible generators'
  s.description = "Rails 3 compatible generators for gems that don't have them yet "

  s.rubyforge_project         = 'rails3-generators'
  s.required_rubygems_version = ">= 1.3.6"
  
  s.add_dependency "railties", ">= 3.0.0"
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "haml-rails"
  s.add_development_dependency "rails", ">= 3.0.0"
  s.add_development_dependency "factory_girl"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'

  s.extra_rdoc_files = ['README.rdoc', 'CHANGELOG.rdoc']
  
  s.post_install_message = %Q{
rails3-generators-#{Rails3::Generators::VERSION}

Be sure to check out the wiki, https://wiki.github.com/indirect/rails3-generators/,
for information about recent changes to this project.

Machinist generators have been removed. Please update your project to use Machinist 2 (https://github.com/notahat/machinist) which contains its own generators.

Fabrication generators have been removed. Please update your project to use Fabrication (https://github.com/paulelliott/fabrication) which contains its own generators.

Mongoid generators have been removed. Please update your project to use Mongoid (https://github.com/mongoid/mongoid) which contains its own generators.
}
end