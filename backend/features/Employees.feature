@employees
Feature: Employees

  @get_employees
  Scenario: Get employees
    Given that I make a get request to the employee service
    When employee service returns status 200
    Then the employee service returns the list of employees

  @get_employee
  Scenario: Get employee with id 1
    Given that I make a get request to the employee service with id 1
    When employee service returns status 200
    Then the employee service return the employee