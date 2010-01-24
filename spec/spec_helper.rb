$:.unshift File.dirname(__FILE__), File.join(File.dirname(__FILE__), %w[.. lib])

require 'rails3-generators'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
end