Feature: User can manually add a training card

  Scenario: Prova
    Given I am a new, authenticated user
    Then I should see "Scheda"

  Scenario: Add a training card
    Given I am a new, authenticated user
    And I am on the RubyOnFitness homepage
    Then I should see "Benvenuto"
    When I follow "Scheda"
    Then I should be on the Workout Plans page
    And I fill in "Nome" with "La mia scheda personale"
    And I fill in "Note" with "Scheda di test"
    And I press "Salva"
    Then I should be on the Workout Plans page
    And I should see "La mia scheda personale"
