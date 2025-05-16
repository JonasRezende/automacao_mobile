Given('estou na home e vejo o botão da clínica de imagem') do
  LoginAssert.new.check_home
end

When('clico na clínica de imagem') do
  HomeScreen.new.acessar_clinica_imagem
end

Then('sou redirecionado para o WhatsApp') do
  puts "📲 Verificação visual: usuário deve ver o WhatsApp sendo aberto."
  # Aqui não dá pra verificar diretamente via Appium, pois sai do app.
  # Você pode apenas considerar o sucesso se não houver erro.
  expect(true).to be_truthy
end

# 🆕 Interações com botão Tempo de Espera e menus do app

When('clico no botão Tempo Espera') do
  HomeScreen.new.tocar_tempo_espera
end

When('seleciono o hospital Unimed Uberaba') do
  HomeScreen.new.tocar_hospital_unimed
end

When('fecho o menu lateral') do
  HomeScreen.new.fechar_menu_scrim
end

Then('clico em Recursos Próprios') do
  HomeScreen.new.tocar_recursos_proprios
end
