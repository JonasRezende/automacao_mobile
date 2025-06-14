Feature: Waiting Period

  @waiting_period @test
  Scenario: Acessar a tela de carências e voltar
    Given que estou na tela de login
    When preencho CPF e senha corretamente
    And clico no botão de login
    Then seleciono uma carteirinha
    And chego na tela inicial com sucesso
    Given que acesso a tela de carências
    Then volto para a home
