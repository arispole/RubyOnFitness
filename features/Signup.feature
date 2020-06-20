Feature: User can sign up

  Scenario: Sign up
    Given I am on the RubyOnFitness homepage
    When I follow "Sign up"
    Then I should be on the Signup Page
    When I fill in "Email" with "test@test.it"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be on the RubyOnFitness homepage