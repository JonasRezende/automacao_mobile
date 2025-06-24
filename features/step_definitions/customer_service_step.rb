require_relative '../android/customer_service_screen'

When('acesso a tela de Customer Service') do
  screen = CustomerServiceScreen.new
  screen.acessar_menu_atendimento
end

Then('preencho e envio o formulario de atendimento') do
  screen = CustomerServiceScreen.new
  screen.interagir_com_saiba_mais
  screen.abrir_enderecos_uteis
  screen.preencher_fale_conosco
  screen.anexar_arquivo
  screen.enviar_formulario
end

Then('preencho e envio o formulario de ouvidoria') do
  screen = CustomerServiceScreen.new
  screen.preencher_ouvidoria
end
