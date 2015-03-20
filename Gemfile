# A sample Gemfile
source "https://rubygems.org"

ruby "2.2.1"

gem "padrino", "~> 0.12"
gem "slim"
gem "mongoid"
gem "mongoid_token"
gem "rack-parser"
gem "ideone-ruby-api"

group :development do
  gem "rake"
  gem "bundler"
  gem "mongoid-tree"
end

group :test do
  gem "rspec"
  gem "rack-test"
  gem "database_cleaner"
  gem "factory_girl"
end

if ENV["SOCIAL_SNIPPET_DEBUG"] == "true"
  gem "pry-byebug"
end

