Feature: Redefinir senha

    @reset_password
    Scenario: Redefinir a senha do usuário com sucesso
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When acesso a tela de redefinir senha
        Then redefino minha senha com sucesso

    @reset_password
    Scenario: Login com a nova senha após redefinição
        Given que estou na tela de login
        When preencho CPF e nova senha
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
