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
    tocar_por_coordenada(540, 1073)
    sleep 1
    send_text("Uberaba")
    sleep 0.5
    fechar_teclado
    sleep 1

    # Descrição
    tocar_por_coordenada(540, 1472)
    sleep 1
    send_text("teste")
    sleep 0.5
    fechar_teclado
    sleep 1
  end

  def anexar_imagem_camera
    puts "📷 Anexando imagem pela câmera"

    try_xpath_click_by_content_desc("Anexar foto")
    sleep 1

    try_xpath_click_by_content_desc("Câmera")
    sleep 2

    puts "📸 Tirando foto"
    tocar_por_coordenada(540, 1962) # bounds [444,1866][636,2058]
    sleep 2

    puts "✅ Confirmando foto tirada"
    tocar_por_coordenada(774, 1972) # bounds [540,1869][1008,2076]
    sleep 2
  end

  def enviar_guia
    puts "📤 Enviando guia"

    scroll_para_baixo
    sleep 2

    try_xpath_click_by_content_desc("Enviar")
    sleep 4 # Aguarda a modal com o protocolo aparecer

    puts "📋 Clicando no botão Copiar protocolo"
    tocar_por_coordenada(884, 1782) # bounds [852,1751][915,1814]
    sleep 2

    puts "🔙 Clicando no botão Voltar"
    tocar_por_coordenada(540, 1941) # bounds [50,1869][1030,2013]
    sleep 1
  end
end
