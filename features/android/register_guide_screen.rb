require_relative '../support/utils'

class RegisterGuideScreen < Utils
  def scroll_home_e_acessa_cadastro
    puts "📱 Scrollando e acessando 'Cadastrar Guia'"
    scroll_para_baixo
    find_element(accessibility_id: "Cadastrar\nGuia").click
  end

  def preencher_formulario
  puts "✍️ Preenchendo formulário da guia"
  scroll_para_baixo

  # E-mail
  tocar_por_coordenada(540, 357)
  send_text("teste@teste.com")

  # Contato
  tocar_por_coordenada(540, 554)
  send_text("34999148672")

  # Tipo de solicitação
  tocar_por_coordenada(540, 854)
  try_xpath_click_by_content_desc("Exame laboratorial")

  # Ciente
  try_xpath_click_by_content_desc("Ciente")

# Cidade
tocar_por_coordenada(540, 1073) # campo Cidade
sleep 1
send_text("Uberaba")
sleep 0.5
fechar_teclado
sleep 1

# Descrição
tocar_por_coordenada(540, 1472) # campo Descrição
sleep 1
send_text("teste")
sleep 0.5
fechar_teclado
sleep 1

end

  def anexar_imagem_galeria
    puts "📷 Anexando imagem da galeria"
    try_xpath_click_by_content_desc("Anexar foto")
    try_xpath_click_by_content_desc("Galeria")

    sleep 2
    puts "👉 Tocando para selecionar a imagem"
    tocar_por_coordenada(285, 1944)
  end

 def enviar_guia
  puts "📤 Enviando guia"

  # Garante que a tela role até os botões ficarem visíveis
  scroll_para_baixo
  sleep 2

  # Clica em Enviar
  try_xpath_click_by_content_desc("Enviar")
  sleep 2

  # Clica em Salvar
  try_xpath_click_by_content_desc("Salvar")
  sleep 2

  # Scroll novamente caso a tela tenha mudado após salvar
  scroll_para_baixo
  sleep 2

  # Clica no botão Copiar (centro do bounds [852,1751][915,1814])
  puts "📋 Clicando no botão Copiar"
  tocar_por_coordenada(884, 1782)
  sleep 2

  # Clica no botão Voltar (centro do bounds [50,1869][1030,2013])
  puts "🔙 Clicando no botão Voltar"
  tocar_por_coordenada(540, 1941)
  sleep 1
  end

end
