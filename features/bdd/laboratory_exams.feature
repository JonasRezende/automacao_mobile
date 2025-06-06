Feature: Laboratory Exams Consultation

    Scenario: Access and interact with a laboratory exam file
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When I access the Laboratory Exams section
        And I open the lab exam details
        And I open the lab PDF exam
        And I download the lab PDF exam
        And I go back from lab screen
        And I go back from lab screen
        And I go back from lab screen