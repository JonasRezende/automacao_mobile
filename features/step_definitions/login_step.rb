# Step definitions para o fluxo de login do Oneplace

# Inclui o módulo que dá acesso às telas mapeadas (Utils, LoginScreen, etc.)
World(Actions)

# Etapa inicial que simula a navegação até a tela de login
Given('que estou na tela de login') do
  puts 'Acessando tela de login'
  login.open_access_options         # Clica em "Selecione uma opção"
  login.choose_client_access        # Seleciona "Acesso Cliente"
  login.access_app                  # Clica em "Acessar o aplicativo"
end

# Preenche CPF e senha a partir dos dados definidos no banco de testes (database.rb)
When('preencho CPF e senha corretamente') do
  puts 'Preenchendo CPF e Senha'

  cpf = DATABASE[:user][:cpf]
  senha = DATABASE[:user][:password]

  login.fill_cpf(cpf)              # Preenche o campo de CPF
  login.fill_password(senha)       # Preenche o campo de senha
end

# Após preencher CPF e senha, aguarda a tela de biometria e recusa habilitação
And('clico no botão de login') do
  puts 'Clicando no botão Enter (login)'
  login.disable_card               # Trata a tela de biometria que aparece após o login

  sleep 2  # ⏳ Dá tempo para a UI exibir a carteirinha antes de seguir
end

# Seleciona uma carteirinha específica (com base no content-desc parcial)
Then('seleciono uma carteirinha') do
  puts 'Selecionando uma carteirinha'
  login.select_card                # Clica na carteirinha com o content-desc parcial
end

# Caso o usuário cancele a seleção de carteirinha
Then('cancelo a seleção de carteirinha') do
  puts 'Cancelando seleção de carteirinha'
  login.cancel_card_selection
end

# Verifica que o usuário chegou com sucesso na tela inicial (home)
Then('chego na tela inicial com sucesso') do
  puts 'Verificando que o usuário chegou na tela inicial'
  LoginAssert.new.check_home
end
