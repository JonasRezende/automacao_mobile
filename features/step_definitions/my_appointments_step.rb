require_relative '../android/my_appointments_screen'

Given('que acesso a tela de Meus Agendamentos') do
  screen = MyAppointmentsScreen.new
  screen.wait_for_load
  screen.acessar_menu_ver_todos
  screen.entrar_em_meus_agendamentos
end

Then('aplico filtros por data') do
  screen = MyAppointmentsScreen.new
  screen.aplicar_filtro_data
end

Then('aplico filtro por profissional') do
  screen = MyAppointmentsScreen.new
  screen.aplicar_filtro_profissional
end

Then('aplico filtro por status') do
  screen = MyAppointmentsScreen.new
  screen.aplicar_filtro_status
end

Then('aplico filtro por unidade') do
  screen = MyAppointmentsScreen.new
  screen.aplicar_filtro_unidade
end

Then('desmarco um agendamento') do
  screen = MyAppointmentsScreen.new
  screen.desmarcar_agendamento
end
