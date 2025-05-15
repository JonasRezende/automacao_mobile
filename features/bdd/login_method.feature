Feature: Login no app Oneplace
    @test
    @login
    Scenario: Login com seleção de carteirinha
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso


    @login
    Scenario: Login com cancelamento da carteirinha
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then cancelo a seleção de carteirinha

Feature: Acesso a funcionalidades via carrossel da Home
    @carrossel @substituicao
    Scenario: Acessar Substituição de Prestadores pelo carrossel
        Given estou na tela inicial e vejo o carrossel
        When clico em Substituição de Prestadores
        Then sou direcionado para a tela de Substituição de Prestadores
