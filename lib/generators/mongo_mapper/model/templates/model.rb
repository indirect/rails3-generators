class <%= class_name %><%= "< #{options[:parent].classify}" if parent? %>
<% unless parent? -%>
  include MongoMapper::Document         
<% end -%>  
<%= embedded_statement if embedded? %>
<%= version_statement if version? %>
<%= timestamps_statement if timestamps? %>

<% unless parent? -%>
# Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
# validates_presence_of :attribute

# Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
# belongs_to :model
# many :model
# one :model

# Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# before_create :your_model_method
# after_create :your_model_method
# before_update :your_model_method 

# Attribute options extras ::::::::::::::::::::::::::::::::::::::::
# attr_accessible :first_name, :last_name, :email

# Validations
# key :name, :required =>  true      

# Defaults
# key :done, :default => false

# Typecast
# key :user_ids, Array, :typecast => 'ObjectId'
  
<% end -%>   

<% model_attributes.each_with_index do |attribute, i| -%>
  key :<%= attribute.name %>, <%= attribute.type_class %><%= ", :index => true" if model_indexes[attribute.name] %>
<% end -%>
end