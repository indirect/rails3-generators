class <%= class_name %><%= "< #{options[:parent].classify}" if options[:parent] %>
<% unless options[:parent] -%>
  include Mongoid::Document 
  include Mongoid::Timestamps
  timestamps!
<% end -%>
<% attributes.each do |attribute| -%>
  field :<%= attribute.name %>, <%= attribute.type_class %>
<% end -%>
end
