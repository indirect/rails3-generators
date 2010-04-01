class <%= class_name %><%= "< #{options[:parent].classify}" if options[:parent] %>
<% unless options[:parent] -%>
  include Mongoid::Document
  <% if options[:timestamps] %> 
    include Mongoid::Timestamps
  <% end %>
  <% if options[:versioning] %>
    include Mongoid::Versioning
  <% end %>
<% end -%>
<% attributes.each do |attribute| -%>
  field :<%= attribute.name %>, :type => <%= attribute.type_class %>
<% end -%>
end
