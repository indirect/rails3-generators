<%= class_name %>.blueprint do
<% attributes.each do |attribute| -%>
  <%= attribute.name %> <%= attribute.default.inspect %>
<% end -%>
end
