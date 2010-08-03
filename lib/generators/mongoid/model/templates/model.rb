class <%= class_name %><%= "< #{parent.classify}" if parent? %>
<% unless parent? -%>
  include Mongoid::Document         
<% end -%>
<%= statements %>
<% unless parent? -%>
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  # validates_presence_of :attribute
 
  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  # belongs_to :model
  # embeds_many :model
  # embeds_one :model
  
  # Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
  # before_create :your_model_method
  # after_create :your_model_method
  # before_update :your_model_method
  
<% end -%>
<% attributes.each do |attribute| -%>
  field :<%= attribute.name %>, :type => <%= attribute.type_class %>
<% end -%>
<%= write_indexes -%>
<%= extra_statements -%>
end
