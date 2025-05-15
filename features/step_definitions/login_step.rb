# Step definitions para o fluxo de login do Oneplace

# Inclui o módulo que dá acesso às telas mapeadas
World(Actions)

Given('que estou na tela de login') do
  puts 'Acessando tela de login'
  login.open_access_options
  login.choose_client_access
  login.access_app
end

When('preencho CPF e senha corretamente') do
  puts 'Preenchendo CPF e Senha'

  cpf = DATABASE[:user][:cpf]
  senha = DATABASE[:user][:password]

  login.fill_cpf(cpf)
  login.fill_password(senha)
end

# ✅ REMOVIDO: método press_enter é desnecessário, pois o botão já foi clicado após o preenchimento da senha
And('clico no botão de login') do
  puts 'Clicando no botão Enter'
  # login.press_enter # ❌ Removido
end

Then('seleciono uma carteirinha') do
  puts 'Selecionando uma carteirinha'
  login.disable_card           # ✅ Clica em "Não habilitar" antes de selecionar a carteirinha
  login.select_card
end

Then('cancelo a seleção de carteirinha') do
  puts 'Cancelando seleção de carteirinha'
  login.cancel_card_selection
end

Then('chego na tela inicial com sucesso') do
  puts 'Verificando que o usuário chegou na tela inicial'
  LoginAssert.new.check_home
end
