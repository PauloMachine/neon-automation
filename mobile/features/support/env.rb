# frozen_string_literal: true

require 'appium_lib'
require 'cucumber'
require 'selenium-webdriver'
$wait = Selenium::WebDriver::Wait.new(timeout: 60)

time  = Time.new
time = time.strftime('%d-%m-%Y-%H-%M-%S')
$logger = Logger.new("./logs/log-#{time}.log")

def load_appium_configuration()
  dir = "#{Dir.pwd}/config/appium.txt"
  Appium.load_appium_txt file: File.expand_path(dir, __FILE__), verbose: true
end

caps = load_appium_configuration()
caps[:appium_lib][:export_session] = true

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object