class <%= class_name %>Observer
  include DataMapper::Observer

  observe <%= class_name %>
end
