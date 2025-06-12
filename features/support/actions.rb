require_relative '../android/login_method_screen'
require_relative '../android/card_exchange_screen'
require_relative '../android/reset_password_screen'
# Adicione aqui os outros arquivos de tela conforme forem usados

module Actions
  def login
    @login ||= LoginMethodScreen.new
  end

  def card_exchange
    @card_exchange ||= CardExchangeScreen.new
  end

  def reset_password
    @reset_password ||= ResetPasswordScreen.new
  end
end

World(Actions)
