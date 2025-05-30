Feature: Consulta de Meus Protocolos
    Como um usuário logado
    Quero acessar meus protocolos
    E visualizar, baixar arquivos e verificar o status da guia


    Scenario: Acessar Meus Protocolos e interagir com arquivos e status
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso

        When acesso Meus Protocolos pela home
        And abro o histórico do protocolo
        And fecho o histórico do protocolo
        And clico em mais opções do protocolo
        And abro um arquivo do protocolo
        And fecho a visualização do arquivo
        And abro o chat do protocolo
        And clico no botão de download do protocolo
        And abro o arquivo baixado do protocolo
        And fecho o arquivo baixado do protocolo
        And clico no botão Voltar dos protocolos
        And clico no botão de Status da Guia
        And clico no botão OK do Status da Guia
        And clico no botão Voltar dos protocolos
