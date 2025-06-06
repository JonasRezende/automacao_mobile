Feature: Consultar Boletos

    @consult_bills

    Scenario: Realizar o fluxo completo de consulta e download de boletos
        Given que estou na tela de login do IRPF
        When preencho CPF e senha corretamente para IRPF
        And clico no botão de login
        Then seleciono a carteirinha do IRPF
        And chego na tela inicial com sucesso
        When acesso o menu de consulta de boletos
        And aplico os filtros de boletos
        And copio o código de barras e visualizo o boleto
        And realizo o download do boleto
        Then volto à tela inicial
