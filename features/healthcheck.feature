Feature: Confirm applications are healthy
  Scenario: people is healthy
    Given app people
    When I GET to /health
    Then I should get a 200 status code
