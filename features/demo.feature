Feature: Confirm happy path

  Scenario: prototypes home loads
    Given app prototypes
    When I visit /
    Then I expect the page to have 'Cross government tools prototypes' 

  
  Scenario: job search by skill loads
    Given app prototypes
    When I visit /jobs/search_by_skill
    Then I expect the page to have '0 results found'

  Scenario: job search by skill is searchable
    Given app prototypes
    When I visit /jobs/search_by_skill?q=Agile
    Then I expect the page to have '5 results found'

  Scenario: job search by skill search result is bookmarkable
    Given app prototypes
    When I visit /jobs/search_by_skill?q=Agile
    And I click on element with xpath '//*[@id="content"]/section/ul/li[1]/div/div'
    Then I expect the page to have 'Create GOV.UK profile'


