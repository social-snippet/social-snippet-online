RACK_ENV = "test" unless defined?(RACK_ENV)
require_relative "../config/boot"

#
# load rack-test
#
require "rack/test"
::RSpec.configure do |conf|
  conf.include ::Rack::Test::Methods
end
