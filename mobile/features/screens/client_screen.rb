# frozen_string_literal: true

require 'faker'
require 'rspec/expectations'

class ClientScreen
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'client'
  end

  def text_exists(text)
    text_exists? text
  end

  def click_btn_floating
    click @mappings['btn_floating']
  end

  def click_btn_register_new
    click @mappings['btn_register_new']
  end

  def fill_in_client_data(type_client)
    if (type_client == 'complete')
      click @mappings['btn_complete']
      fill_in @mappings['field_name_mother'], (Faker::Superhero.name)
      fill_in @mappings['field_name_father'], (Faker::Superhero.name)
    end
    fill_in @mappings['field_name'], (Faker::Name.name)
    fill_in @mappings['field_rg'], (rand 1111111..9999999)
    fill_in @mappings['field_cpf'], (rand 11111111111..99999999999)
    fill_in @mappings['field_date'], (rand 11111111..99999999)
    fill_in @mappings['field_address_name'], (Faker::Artist.name)
    fill_in @mappings['field_address_number'], (rand 1111..9999)
    fill_in @mappings['field_address_district'], (Faker::Game.title)
    fill_in @mappings['field_address_cep'], (rand 11111111..99999999)
    fill_in @mappings['field_address_city'], (Faker::Movie.title)
  end

  def click_btn_save
    click @mappings['btn_save']
  end

  def checking_layout
    element_exists? @mappings['field_name']
    element_exists? @mappings['field_rg']
    element_exists? @mappings['field_cpf']
    element_exists? @mappings['field_date']
    element_exists? @mappings['field_address_name']
    element_exists? @mappings['field_address_number']
    element_exists? @mappings['field_address_district']
    element_exists? @mappings['field_address_cep']
    element_exists? @mappings['field_address_city']
  end
end