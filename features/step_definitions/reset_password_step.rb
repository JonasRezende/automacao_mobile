reset = ResetPasswordScreen.new

When('acesso a tela de redefinir senha') do
  reset.acessar_resetar_senha
end

Then('redefino minha senha com sucesso') do
  reset.redefinir_senha
end
