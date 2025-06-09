require_relative '../android/notifications_screen'

Before do
  @notifications = NotificationsScreen.new
end

# features/step_definitions/common_steps.rb
Given('que estou logado no app') do
  steps %(
    Given que estou na tela de login
    When preencho CPF e senha corretamente
    And clico no botão de login
    Then seleciono uma carteirinha
    And chego na tela inicial com sucesso
  )
end

When('clico no ícone de notificações') do
  @notifications.abrir_notificacoes
end

Then('vejo os detalhes e volto') do
  @notifications.ver_detalhes_e_voltar
end

Then('acesso novidades e vejo uma notificação') do
  @notifications.abrir_novidades
end

Then('acesso configurações de notificações') do
  @notifications.abrir_configuracoes
end

Then('retorno à home após configurações') do
  @notifications.voltar_para_home
end

