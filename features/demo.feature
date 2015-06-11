Feature: Confirm happy path

  Scenario: prototypes home loads
    Given app prototypes
    When I visit /
    Then I expect the page to have 'Cross government tools prototypes' 

  
  Scenario: job search by feature
    Given app prototypes
    When I visit /jobs/search_by_skill
    Then I expect the page to have '0 results found'
