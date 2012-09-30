require "rails/generators"

module Rails3Generators
end

Rails::Generators.hidden_namespaces << "rails"

%w(active_record data_mapper active_model).each do |orm|
  Rails::Generators.hidden_namespaces <<
  [
    "#{orm}:migration",
    "#{orm}:model",
    "#{orm}:observer",
    "#{orm}:session_migration",
  ]
end

%w(test_unit rspec shoulda).each do |test|
  Rails::Generators.hidden_namespaces <<
  [
    "#{test}:controller",
    "#{test}:helper",
    "#{test}:integration",
    "#{test}:mailer",
    "#{test}:model",
    "#{test}:observer",
    "#{test}:scaffold",
    "#{test}:view",
    "#{test}:performance",
    "#{test}:plugin",
  ]
end

%w(fabrication factory_girl machinist).each do |fixture_replacement|
  Rails::Generators.hidden_namespaces <<
  [
    "#{fixture_replacement}:model",
  ]
end

%w(erb haml mustache).each do |template|
  Rails::Generators.hidden_namespaces <<
  [
    "#{template}:controller",
    "#{template}:scaffold",
    "#{template}:mailer"
  ]
end

Rails::Generators.hidden_namespaces.flatten!
