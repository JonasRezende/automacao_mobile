Feature: Acesso ao tempo de espera

    Scenario: Acessar tempo de espera e recursos próprios
        Given que estou na tela de login
        When faço login com CPF "SEU_CPF" e senha "SUA_SENHA"
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When clico no botão Tempo Espera
        And seleciono o hospital Unimed Uberaba
        And fecho o menu lateral
        Then clico em Recursos Próprios
