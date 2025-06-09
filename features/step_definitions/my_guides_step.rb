require_relative '../android/my_guides_screen'

Before do
  @my_guides_screen = MyGuidesScreen.new
end

Given('que estou na tela de login IRPF') do
  login.open_access_options
  login.choose_client_access
  login.access_app
  login.fill_cpf('97666920334')
  login.fill_password('97666920334')
  login.disable_card
  login.select_card_irpf
end

When('acesso a tela Minhas Guias') do
  @my_guides_screen.acessar_minhas_guias
end

Then('interajo com os cards e histórico') do
  @my_guides_screen.interagir_com_cards
end

Then('aplico filtros por status e tipo') do
  @my_guides_screen.aplicar_filtros_status_tipo
end

Then('aplico filtro por número da guia') do
  @my_guides_screen.aplicar_filtro_numero_guia('70028008462')
end

Then('aplico filtro por intervalo de datas') do
  @my_guides_screen.aplicar_filtro_data(inicio: '01/01/2025', fim: '01/04/2025')
end
