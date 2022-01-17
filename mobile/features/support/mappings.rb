require 'yaml'
require 'logger'

def get_screen_mappings(screen)
  dir = "#{Dir.pwd}/features/elements/#{screen}_elements.yaml"
  screen_mappings = YAML.load_file(dir)
  @mappings = screen_mappings[screen]
end