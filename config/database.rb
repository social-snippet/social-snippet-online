host = "localhost"
port = 27017

database_name = case ::Padrino.env
  when :development then "ssnip_development"
  when :production  then "ssnip_production"
  when :test        then "ssnip_test"
end

::Mongoid::Config.sessions =
  if ENV["MONGO_URI"]
    {default: {uri: ENV["MONGO_URI"]}}
  else
    {default: {hosts: ["#{host}:#{port}"], database: database_name}}
  end

