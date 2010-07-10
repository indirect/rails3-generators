class <%= class_name %><%= "< #{options[:parent].classify}" if parent? %>
<% unless parent? -%>
  include DataMapper::Resource

  property :id, Serial
<% end -%>
<% attributes.each do |attribute| -%>
  property :<%= attribute.name %>, <%= attribute.type_class %>
<% end -%>

<%= timestamp_statements if timestamps? %>
end
