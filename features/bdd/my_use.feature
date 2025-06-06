Feature: Consulta de Minhas Utilizações

    Scenario: Acessar uma utilização e baixar o PDF
        Given que estou na tela de login
        When preencho CPF e senha corretamente para IRPF
        And clico no botão de login
        Then seleciono a carteirinha do IRPF
        And chego na tela inicial com sucesso

        When acesso Minhas Utilizações pela home
        And clico em um PDF de utilização
        And clico no botão de download do PDF
        And clico no botão Salvar
        And permito caso apareça a solicitação
        And clico no botão Mais Opções
        And clico no botão Baixar
        And clico no botão Voltar
        And clico no botão Voltar
        And clico no botão Voltar


## tem que corrigir, após acessar a tela de minhas utilizações, tem que abrir p pdf salvar baixar e voltar