Feature: Login no app Oneplace

    @login
    Scenario: Login com seleção de carteirinha
        Given que estou na tela de login
        When faço login com CPF "SEU_CPF" e senha "SUA_SENHA"
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso


    @login
    Scenario: Login com cancelamento da carteirinha
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then cancelo a seleção de carteirinha

