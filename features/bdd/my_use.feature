Feature: Consulta de Minhas Utilizações
    Como um usuário logado
    Quero acessar minhas utilizações
    E visualizar ou baixar o PDF da utilização


    Scenario: Acessar uma utilização e baixar o PDF
        Given que estou na tela de login
        When faço login com CPF "97666920334" e senha "97666920334"
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso

        When acesso Minhas Utilizações pela home
        And clico no PDF da utilização
        And clico no botão de download do PDF
        And clico no botão Salvar
        And permito caso apareça a solicitação
        And clico no botão Mais Opções
        And clico no botão Baixar
        And clico no botão Voltar
