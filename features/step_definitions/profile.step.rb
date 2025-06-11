require_relative '../android/profile_screen' # Certifique-se de que o caminho está correto
require_relative '../android/login_method_screen'   # Adicione esta linha se não estiver incluída

Before do
  @profile_screen = ProfileScreen.new
  @login = LoginScreen.new # Adicione esta linha para inicializar a LoginScreen
end

Given('que estou logado como gestao de dependente') do
  # Removi a inicialização de 'login' aqui, pois ela deve ser feita no 'Before'
  @login.open_access_options # Use @login
  @login.choose_client_access # Use @login
  @login.access_app # Use @login
  @login.fill_cpf('08610522695') # Use @login
  @login.fill_password('unimed21') # Use @login
  @login.disable_card # Use @login
  @login.select_card_by_description('Joao Lucas r Beirigo') # Use @login
  @login.select_card_by_description('REG-PP-PJ-AMBHOSP-OBST-RB-E-PARTICIPATIVO') # Use @login
end

When('acesso a tela Meu Perfil') do
  @profile_screen.acessar_perfil # Corrigi o nome do método para 'acessar_perfil' conforme sua ProfileScreen
end

Then('edito minhas informações pessoais') do
  @profile_screen.editar_informacoes_pessoais # Corrigi o nome do método para 'editar_informacoes_pessoais'
end

Then('acesso as informações do contrato') do
  @profile_screen.acessar_informacoes_contrato
end

Then('gerencio acessos') do
  @profile_screen.gerenciar_acessos
end

Then('altero a foto do perfil') do
  @profile_screen.alterar_foto_perfil
end