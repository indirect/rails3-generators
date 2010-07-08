class <%= class_name %><%= "< #{options[:parent].classify}" if parent? %>
<% unless parent? -%>
  include Mongoid::Document
  <% else %>                   

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
<%= version_statement if version? %>
<%= timestamps_statement if timestamps? %>

<%= embedded_statement if embedded? %>    

<% model_attributes.each do |attribute| -%>
  key :<%= attribute.name %>, <%= attribute.type_class %>
<% end -%>

<%= model_indexes.keys.map { |name| "  index :#{name.to_s}, :unique => true" } %>

<%= "  cache" if cache? %>
<%= "  enslave" if enslave? %>
end
