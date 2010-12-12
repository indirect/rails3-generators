class <%= class_name %>
  include ActiveModel::Serialization
  include ActiveModel::Validations
<% if read_properties? %>
  attr_reader <%= read_properties %>
<% end %>
<% if write_properties? %>
  attr_writer <%= write_properties %>
<% end %>
<% if accessor_properties? %>
  attr_accessor <%= accessor_properties %>
<% end %>
end
