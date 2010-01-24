class <%= class_name %><%= "< #{options[:parent].classify}" if options[:parent] %>
<% unless options[:parent] -%>
  include MongoMapper::Document 

  key :key, String
<% end -%>
<% attributes.each do |attribute| -%>
  key :<%= attribute.name %>, <%= attribute.type_class %>
<% end -%>
end
