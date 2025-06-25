Feature: Institutional

    @test
    Scenario: Acessar e navegar pelo menu institucional
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When acesso e navego pelo menu institucional com sucesso