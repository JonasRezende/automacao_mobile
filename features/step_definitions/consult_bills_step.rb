require_relative '../android/consult_bills_screen'

consult_bills = ConsultBillsScreen.new

Given('que estou na tela de login do IRPF') do
  puts '🔐 Login IRPF'
  login.open_access_options
  login.choose_client_access
  login.access_app
end

When('acesso o menu de consulta de boletos') do
  consult_bills.acessar_menu_boletos
end

And('aplico os filtros de boletos') do
  consult_bills.aplicar_filtros_boletos
end

And('copio o código de barras e visualizo o boleto') do
  consult_bills.copiar_codigo_e_visualizar
end

And('realizo o download do boleto') do
  consult_bills.baixar_boleto
end

Then('volto à tela inicial') do
  consult_bills.voltar_tela_inicial
end
