# Step definitions para o fluxo de login do Oneplace

# Inclui o módulo que dá acesso às telas mapeadas
World(Actions)

# Passo que navega até a tela de login
Given('que estou na tela de login') do
  puts 'Acessando tela de login'
  login.open_access_options         # Clica em "Selecione uma opção"
  login.choose_client_access        # Escolhe "Acesso Cliente"
  login.access_app                  # Clica em "Acessar o aplicativo"
end

# Preenche CPF e senha com dados da base de teste
When('preencho CPF e senha corretamente') do
  puts 'Preenchendo CPF e Senha'

  # Busca os dados do usuário no arquivo database.rb
  cpf = DATABASE[:user][:cpf]
  senha = DATABASE[:user][:password]

  # Preenche os campos
  login.fill_cpf(cpf)
  login.fill_password(senha)
end

# Simula o clique no botão "Enter" da tela de login
And('clico no botão de login') do
  puts 'Clicando no botão Enter'
  login.press_enter                 # Toca na tela onde está o botão de login
end

# Quando uma carteirinha é selecionada após o login
Then('seleciono uma carteirinha') do
  puts 'Selecionando uma carteirinha'
  login.select_card                 # Clica na carteirinha para seguir
end

# Quando o usuário decide cancelar a seleção de carteirinha
Then('cancelo a seleção de carteirinha') do
  puts 'Cancelando seleção de carteirinha'
  login.cancel_card_selection       # Clica no botão "Cancelar"
end

# Passo final de validação que verifica se o usuário chegou na tela de home
Then('chego na tela inicial com sucesso') do
  puts 'Verificando que o usuário chegou na tela inicial'
  LoginAssert.new.check_home        # Usa a classe LoginAssert para verificar o sucesso do login
end
