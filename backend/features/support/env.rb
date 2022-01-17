require 'factory_bot'
require 'faker'
require 'httparty'
require 'rspec'

require_relative 'helpers'

CONFIG = YAML.load_file("#{Dir.pwd}/features/config/#{ENV['ENVIRONMENT']}.yaml")

World(REST)
