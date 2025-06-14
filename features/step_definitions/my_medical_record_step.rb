Given('que acesso o Meu Prontuário') do
  screen = MedicalRecordScreen.new
  screen.wait_for_load
  screen.acessar_menu_ver_todos
  screen.entrar_no_registro_medico
end

Then('realizo os filtros por profissional e tipo') do
  screen = MedicalRecordScreen.new

  screen.click_content_desc('BUSCAR')
  sleep 2

  screen.tap_bounds(50, 1789, 1030, 1945)
  sleep 1
  screen.type_search('Danilo')
  sleep 2

  screen.click_content_desc('Danilo Cortes Angelo')
  sleep 2

  screen.click_content_desc('BUSCAR')
  sleep 1

  filtros = ['EVOLUÇÃO', 'DOCUMENTO', 'RECEITA', 'INTERNAÇÃO', 'ENCAMINHAMENTO']

  filtros.each do |filtro|
    screen.click_content_desc('TIPO')
    sleep 1
    screen.click_content_desc(filtro)
    sleep 2
  end

  screen.click_content_desc('TIPO')
  sleep 1
  screen.click_content_desc('Limpar filtro')
  screen.wait_for_load
end

Then('realizo os filtros por data') do
  screen = MedicalRecordScreen.new

  screen.tap_bounds(971, 123, 1037, 189)
  sleep 1

  screen.tap_bounds(912, 252, 1056, 396)
  sleep 1

  screen.tap_bounds(120, 666, 528, 834)
  sleep 1
  screen.type_raw('01/01/2023')
  sleep 1

  screen.tap_bounds(552, 666, 960, 834)
  sleep 1
  screen.type_raw('01/01/2024')
  sleep 1

  screen.click_content_desc('OK')
  screen.wait_for_load
end

Then('compartilho prontuário com médico específico') do
  screen = MedicalRecordScreen.new

  # Abre modal de compartilhamento
  screen.tap_bounds(847, 107, 946, 206)
  sleep 1

  # Clica na opção "Médico específico"
  screen.click_content_desc('Medico específico')
  sleep 1

  # Digita o código do médico
  screen.tap_bounds(165, 910, 915, 1066)
  sleep 1
  screen.type_raw('110688')

  # Espera a busca ser processada
  sleep 3

  # Clica em "Tempo de compartilhamento" via bounds
  screen.tap_bounds(165, 924, 915, 1077)
  sleep 1

  # Seleciona "1 dia" via bounds
  screen.tap_bounds(30, 1458, 1050, 1626)
  sleep 1

  # Clica em "Compartilhar" via bounds
  screen.tap_bounds(270, 1099, 810, 1243)
  sleep 2

  # Clica no botão "Aceitar e compartilhar"
screen.tap_bounds(300, 1835, 780, 1895)
sleep 2

  # Clica no botão OK
  screen.click_content_desc('OK')
end

Then('finalizo e compartilho com todos os médicos') do
  screen = MedicalRecordScreen.new

  # 1. Clica no botão para finalizar compartilhamento
  screen.click_content_desc('Finalizar Compartilhamento')
  sleep 2

  # 2. Clica em "Sim"
  screen.click_content_desc('Sim')
  sleep 2

  # 3. Clica em "OK"
  screen.click_content_desc('OK')
  sleep 2

  # 4. Seleciona "Todos os Médicos"
  screen.click_content_desc('Todos os Médicos')
  sleep 2

  # 5. Clica em "OK"
  screen.click_content_desc('OK')
  sleep 2

  # 6. Clica no botão "Aceitar e compartilhar"
  screen.tap_bounds(300, 1835, 780, 1895)
  sleep 2

  # 7. Confirma com botão OK após o aceite
  screen.click_content_desc('OK')
  sleep 3

  # 8. Baixa o PDF compartilhado
  puts "📄 Abrindo PDF compartilhado"
  screen.tap_bounds(960, 754, 1020, 814)  # ícone PDF
  sleep 5 # espera o carregamento do PDF

  puts "⬇️ Iniciando download"
  screen.tap_bounds(936, 84, 1080, 228)   # ícone download
  sleep 2

  screen.click_content_desc('Salvar')
  sleep 5 # espera o PDF abrir na tela cheia

  puts "📁 Clicando em Mais opções"
  screen.click_content_desc('Mais opções')
  sleep 2

  puts "📥 Clicando em Baixar"
  screen.tap_bounds(484, 432, 1020, 505)
  sleep 2

  # 9. Volta três vezes para a tela anterior
  4.times do
    screen.click_content_desc('Voltar')
    sleep 1
  end
end

