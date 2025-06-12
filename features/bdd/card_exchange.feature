Feature: Troca de carteirinha

    @card_exchange
    Scenario: Trocar a carteirinha do beneficiário
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        And troco para a carteirinha inativa
