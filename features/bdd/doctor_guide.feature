Feature: Consulta ao Guia Médico

    Scenario: Buscar e interagir com informações de um médico
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When acesso o Guia Médico pela home
        And clico no botão Pesquisar
        And digito o nome do médico
        And clico no botão de buscar médico
        And seleciono o médico encontrado
        And clico no endereço do médico
        And confirmo o modal do mapa
        And fecho o navegador externo
        And faço rolagem até o fim da tela
        And clico no telefone do médico
        Then confirmo o modal de ligação