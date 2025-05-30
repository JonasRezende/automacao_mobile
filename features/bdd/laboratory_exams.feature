Feature: Laboratory Exams Consultation
        As a logged-in user
        I want to access laboratory exams
        And interact with exam documents and downloads

    @test
    Scenario: Access and interact with a laboratory exam file
        Given that I am logged in
        When I access the Laboratory Exams section
        And I open the lab exam details
        And I open the lab PDF exam
        And I download the lab PDF exam
        And I go back from lab screen
        And I go back from lab screen
        And I go back from lab screen

