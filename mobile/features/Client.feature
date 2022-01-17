@client
Feature: Client

  Background:
    Given I'm on the client registration screen

  @screen
  Scenario: Checking client registration screen layout
    When I click to register a new client
    Then the screen to fill in the customer fields is displayed

  @create_client
  Scenario: Create new basic client
    When I click to register a new client
    And I create a new "basic" client 
    Then should be displayed a message "Cadastro efetuado com sucesso"

  @create_client
  Scenario: Create new complete client
    When I click to register a new client
    And I create a new "complete" client
    Then should be displayed a message "Cadastro efetuado com sucesso"