Feature: Electronic Card

    Scenario: Acessar e interagir com o Cartão Eletrônico
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When acesso e interajo com o cartão eletrônico
