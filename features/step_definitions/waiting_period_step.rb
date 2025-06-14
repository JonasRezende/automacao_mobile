require_relative '../android/waiting_period_screen'

Dado('que acesso a tela de carências') do
  screen = WaitingPeriodScreen.new
  puts "➡️ Acessando tela de carências"
  screen.wait_for_load
  screen.acessar_menu_ver_todos
  screen.entrar_em_carencias
end

Então('volto para a home') do
  screen = WaitingPeriodScreen.new
  screen.click_content_desc('Voltar')
end
