require_relative '../android/formal_denial_screen'

Before do
  @formal_denial = FormalDenialScreen.new
end

When('acesso a tela de Formal Denial of Coverage') do
  @formal_denial.acessar_formulario
end

Then('preencho e envio o formulario de formalizacao') do
  @formal_denial.preencher_formulario
  @formal_denial.anexar_arquivo
  @formal_denial.enviar_formulario
end
