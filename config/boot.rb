RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined?(RACK_ENV)
PADRINO_ROOT = ::File.expand_path("../..", __FILE__) unless defined?(PADRINO_ROOT)

require "padrino"
require "mongoid"
require "slim"

::Padrino.configure_apps do
end

::Padrino.before_load do
end

::Padrino.after_load do
end

::Padrino.load!

