# frozen_string_literal: true

Given('that I make a get request to the employee service') do
  @request_employees = employees.get_employees
end

Given('that I make a get request to the employee service with id {int}') do |id|
  @id = id
  @request_employees = employees.get_employee(@id)
end

When('employee service returns status {int}') do |status_code|
  expect(@request_employees.code).to eq status_code
end

Then('the employee service returns the list of employees') do
  expect(@request_employees.message).not_to be_empty
end

Then('the employee service return the employee') do
  expect(@request_employees.message).not_to be_empty
end