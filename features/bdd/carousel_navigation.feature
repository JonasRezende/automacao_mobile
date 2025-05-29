Feature: Acesso a funcionalidades da Home

    @imagem @home
    Scenario: Acessar clínica de imagem e abrir WhatsApp
        Given que estou na tela de login
        When faço login com CPF "SEU_CPF" e senha "SUA_SENHA"
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When clico na clínica de imagem
        Then sou redirecionado para o WhatsApp
