Feature: Meu Perfil


    Scenario: Acessar e editar dados do perfil do beneficiário
        Given que estou logado como gestao de dependente
        When acesso a tela Meu Perfil
        Then edito minhas informações pessoais
        And acesso as informações do contrato
        And gerencio acessos
        And altero a foto do perfil