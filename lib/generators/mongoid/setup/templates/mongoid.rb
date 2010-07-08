db_config = YAML::load(File.read(Rails.root + "/config/database.mongo.yml"))

if db_config[Rails.env] && db_config[Rails.env]['adapter'] == 'mongodb'
  mongo = db_config[Rails.env]                         
  connection = Mongo::Connection.new(mongo['host'])
  Mongoid.database = connection.db(mongo["database"])
  if mongo["username"]
    Mongoid.database.authenticate(mongo["username"], mongo["password"])
  end
end