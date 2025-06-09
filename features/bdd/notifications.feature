Feature: Notificações

    Scenario: Acessar, visualizar e configurar notificações
        Given that I am logged in
        When clico no ícone de notificações
        Then vejo os detalhes e volto
        And acesso novidades e vejo uma notificação
        And acesso configurações de notificações
        And retorno à home após configurações
