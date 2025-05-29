Feature: Consulta de Demonstrativo de IRPF
    Como um usuário logado
    Quero acessar meu Demonstrativo de IRPF
    E visualizar ou baixar o PDF do demonstrativo


    Scenario: Acessar o Demonstrativo e baixar o PDF
        Given que estou na tela de login
        When preencho CPF e senha corretamente para IRPF
        And clico no botão de login
        Then seleciono a carteirinha do IRPF
        And chego na tela inicial com sucesso

        # Fluxo Demonstrativo IRPF
        When acesso Demonstrativo de IRPF pela home
        And clico no PDF do Demonstrativo
        And clico no botão de download do IRPF
        And clico no botão Salvar do IRPF
        And permito caso apareça a solicitação
        And clico no botão Mais Opções do IRPF
        And clico no botão Baixar do IRPF
        And clico no botão Voltar do IRPF
        And clico no botão Voltar novamente
        And clico no botão Voltar mais uma vez
