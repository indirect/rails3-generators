class <%= class_name %><%= "< #{options[:parent].classify}" if options[:parent] %>
<% unless options[:parent] -%>
  include MongoMapper::Document 

  key :key, String                  
  
  timestamps!
  
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  # validates_presence_of :attribute
 
  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  # belongs_to :model
  # many :model
  # one :model
  
  # Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
  # before_craete :your_model_method
  # after_create :your_model_method
  # before_upate :your_model_method
  
<% end -%>
<% attributes.each do |attribute| -%>
  key :<%= attribute.name %>, <%= attribute.type_class %>
<% end -%>
end
