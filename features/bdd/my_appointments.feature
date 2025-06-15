Feature: My Appointments

  @my_appointments
  Scenario: Filtrar e desmarcar agendamento
    Given que estou na tela de login
    When preencho CPF e senha corretamente
    And clico no botão de login
    Then seleciono uma carteirinha
    And chego na tela inicial com sucesso
    Given que acesso a tela de Meus Agendamentos
    Then aplico filtros por data
    And aplico filtro por profissional
    And aplico filtro por status
    And aplico filtro por unidade
    Then desmarco um agendamento
    And volto para a home
