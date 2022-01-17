# frozen_string_literal: true

Given(/^I'm on the client registration screen$/) do
  @client = ClientScreen.new
  @client.text_exists('Cadastro de Clientes')
end

When(/^I click to register a new client$/) do
  @client.click_btn_floating
  @client.click_btn_register_new
end

And(/^I create a new "([^"]*)" client$/) do |type_client|
  @client.fill_in_client_data(type_client)
  @client.click_btn_save
end

Then(/^should be displayed a message "([^"]*)"$/) do |text|
  @client.text_exists(text)
end

Then(/^the screen to fill in the customer fields is displayed$/) do
  @client.checking_layout
end