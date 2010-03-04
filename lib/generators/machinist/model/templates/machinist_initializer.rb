# Add other envs here e.g. cucumber
if Rails.env.test?
  require 'machinist'
  # require 'machinist/active_record'
  
  def Machinist.clear!
    Sham.clear
    # ActiveRecord::Base.clear_blueprints!
  end
  
  def Machinist.load_blueprints
    Dir[Rails.root.join(<%= options[:dir].inspect %>, "**", "*.rb")].each do |file|
      load file
    end
  end
  
  # Put Machinist.load_blueprints in the test_helper.rb
  
end