# Step definitions para o fluxo de login do Oneplace
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

# ✅ Login específico para IRPF
When('preencho CPF e senha corretamente para IRPF') do
  puts 'Preenchendo CPF e Senha para IRPF'

  cpf = '97666920334'
  senha = '97666920334'

  login.fill_cpf(cpf)
  login.fill_password(senha)
end

# ✅ Login específico para Gestão de Dependente
When('preencho CPF e senha para gestao de dependente') do
  puts 'Preenchendo CPF e Senha para Gestão de Dependente'

  cpf = '08610522695'
  senha = 'unimed21'

  login.fill_cpf(cpf)
  login.fill_password(senha)
end

And('clico no botão de login') do
  puts 'Clicando no botão Enter (login)'
  login.disable_card
  sleep 2
end

Then('seleciono uma carteirinha') do
  login.select_card
end

Then('seleciono a carteirinha do IRPF') do
  login.select_card_irpf
end

Then('seleciono beneficiário e carteirinha de dependente') do
  login.select_card_by_description('Joao Lucas r Beirigo')
  login.select_card_by_description('REG-PP-PJ-AMBHOSP-OBST-RB-E-PARTICIPATIVO')
end

Then('cancelo a seleção de carteirinha') do
  login.cancel_card_selection
end

Then('chego na tela inicial com sucesso') do
  puts 'Verificando que o usuário chegou na tela inicial'
  LoginAssert.new.check_home
end
