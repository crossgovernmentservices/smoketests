Feature: Confirm applications are healthy

  # I'm well aware of scenario outlines for lowering the copy/paste
  # effort, but the '--out report.json' doesn't show pass/fail
  # for the individual apps.

  # Scenario Outline: apps are up
  #  Given app <app>
  #  When I GET to /
  #  Then I should get a 200 status code
  #
  #  Examples:
  #    | app               |
  #    | home              |
  #    | locations         |
  #    | people            |
  #    | prototypes        |

  #Scenario: home is up
  #Given app home
  #When I GET to /
  #Then I should get a 200 status code
 
    #  Scenario: locations is up
    #Given app locations
    #When I GET to /
    #Then I should get a 200 status code

    Scenario: people is healthy
    Given app people
    When I GET to /health
    Then I should get a 200 status code

    #Scenario: prototypes is up
    #Given app prototypes
    #When I GET to /
    #Then I should get a 200 status code
