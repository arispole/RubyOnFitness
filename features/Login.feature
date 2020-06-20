Feature: User can log in

  Scenario: Log in
    Given I am on the RubyOnFitness homepage
    When I follow "Log in"
    Then I should be on the Login Page
    When I fill in "Email" with "andrea.giallo@hotmail.it"
    And I fill in "Password" with "password"
    And I press "Log in"
    Then I should be on the Login Page