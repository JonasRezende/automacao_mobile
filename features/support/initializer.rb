# Arquivo: features/support/initializer.rb

# Módulo que centraliza o acesso às telas (screens) da automação
module Actions
  # Tela de login
  def login
    @login ||= LoginScreen.new
  end

  # Tela de validações do login (home)
  def login_assert
    @login_assert ||= LoginAssert.new
  end

  # Caso você tenha uma tela "home", pode adicionar aqui também
  def home
    @home ||= HomeScreen.new
  end

  # Adicione aqui outras telas conforme for criando, por exemplo:
  # def profile
  #   @profile ||= ProfileScreen.new
  # end
end

# Torna o módulo disponível globalmente em todos os steps
World(Actions)
