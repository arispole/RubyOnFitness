Feature: User can manually add a training card

  Scenario: Add a training card
    Given I am a new, authenticated user
    When I follow "Scheda"
    Then I should be on the Workout Plans page
    When I follow "Aggiungi"
    And I fill in "Nome" with "La mia scheda personale"
    And I fill in "Note" with "Scheda di test"
    And I press "Salva"
    Then I should be on the Workout Plans page
    And I should see "La mia scheda personale"
