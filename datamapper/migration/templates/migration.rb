migration <%= migration_number.to_i %>, :<%= migration_file_name %> do 
  up do
<% unless attributes.empty? -%>
    modify_table :<%= table_name %> do
<% attributes.each do |attribute| -%>
      <%= migration_action %>_column :<%= attribute.name %><% if migration_action == 'add' %>, :<%= attribute.type_class %><% end -%>
<% end -%>
    end
<% end -%>
  end

  down do
<% unless attributes.empty? -%>
    modify_table :<%= table_name %> do
<% attributes.reverse.each do |attribute| -%>
      <%= migration_action == 'add' ? 'drop' : 'add' %>_column :<%= attribute.name %><% if migration_action == 'drop' %>, :<%= attribute.type_class %><% end -%>
<% end -%>
    end
<% end -%>
  end
end
