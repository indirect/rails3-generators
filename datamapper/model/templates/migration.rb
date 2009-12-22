migration <%= migration_number.to_i %>, :<%= migration_file_name %> do
  up do
    create_table :<%= table_name %> do
<% attributes.each do |attribute| -%>
      column :<%= attribute.name -%>, <%= attribute.type_class %>
<% end -%>
<% if options[:timestamps] %>
      column :created_at, DateTime
      column :updated_at, DateTime
<% end -%>
    end
  end

  down do
    drop_table :<%= table_name %>
  end
end
