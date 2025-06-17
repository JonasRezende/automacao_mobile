require_relative '../android/profile_screen' # Certifique-se de que o caminho está correto
require_relative '../android/login_method_screen'   # Adicione esta linha se não estiver incluída

Before do
  @profile_screen = ProfileScreen.new
  @login = LoginScreen.new # Adicione esta linha para inicializar a LoginScreen
end

Given('que estou logado como gestao de dependente') do
  @login.open_access_options
  @login.choose_client_access
  @login.access_app
  @login.fill_cpf('08610522695')
  @login.fill_password('unimed21')
  @login.disable_card
  @login.select_beneficiary("Joao Lucas Rodrigues Beirigo\nPróprio Responsável") # <- AQUI É O AJUSTE
  @login.select_card_by_description('REG-PP-PJ-AMBHOSP-OBST-RB-E-PARTICIPATIVO')
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