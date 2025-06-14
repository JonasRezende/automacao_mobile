Feature: Meu Prontuário

    @my_medical_record
        Scenario: Acessar, aplicar filtros e compartilhar Meu Prontuário
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso

        # Ações em Meu Prontuário
        Given que acesso o Meu Prontuário
        Then realizo os filtros por profissional e tipo
        Then realizo os filtros por data
        Then compartilho prontuário com médico específico
        Then finalizo e compartilho com todos os médicos
        Then abro e baixo o PDF compartilhado
