require_relative '../support/utils'

class CustomerServiceScreen < Utils
  def acessar_menu_atendimento
    puts "📜 Acessando botão Ver Todos com scroll"
    scroll_para_elemento_com_content_desc("Ver\nTodos")
    find_element(accessibility_id: "Ver\nTodos").click
    sleep 2

    puts "⏬ Scroll na modal aberta"
    scroll_para_baixo
    sleep 1

    puts "📘 Tocando na funcionalidade Atendimento ao Cliente"
    tocar_por_coordenada(648, 651)
    sleep 2
  end

  def interagir_com_saiba_mais
    puts "📞 Clicando em Telefones Úteis"
    tocar_por_content_desc('Saiba Mais')
    sleep 2

    puts "🔎 Clicando no telefone do Call Center"
    tocar_por_content_desc("Call Center\nCanal de atendimento de primeira instância apto para prestar informações ou receber e tratar solicitações, sugestões, reclamações ou elogios.\n0800 034 3133")
    sleep 1
    tocar_por_content_desc('Sim')
    sleep 5

    puts "↩️ Retornando ao aplicativo"
    $driver.activate_app('com.unimed.app.oneplace.dev')
    sleep 2

    begin
      puts "🔙 Clicando no botão 'Voltar' da tela do Call Center"
      find_element(accessibility_id: 'Voltar').click
      sleep 2
    rescue
      puts "⚠️ Botão 'Voltar' não encontrado – seguindo mesmo assim"
    end
  end

  def abrir_enderecos_uteis
    puts "📍 Acessando Endereços Úteis"
    tocar_por_coordenada(566, 1093)
    sleep 2
    tocar_por_content_desc("Unimed Matriz\nRua Alaor Prata, 294, Centro, Uberaba - MG CEP 38.015-010\nHorário de Funcionamento:\nsegunda a sexta-feira, das 7h às 19h")
    sleep 1
    tocar_por_content_desc('Sim')
    sleep 2
    tocar_por_content_desc('Fechar guia')
    sleep 1
    tocar_por_content_desc('Voltar')
    sleep 1
  end

  def preencher_fale_conosco
    puts "💬 Acessando Fale Conosco"
    tocar_por_coordenada(566, 1462)
    sleep 2

    puts "🧑‍💼 Preenchendo Nome"
    tocar_por_coordenada(540, 863)
    sleep 1
    fechar_teclado
    sleep 0.5
    $driver.action.send_keys('Jonas Willian Silva Rezende').perform
    sleep 1
    fechar_teclado

    puts "📧 Preenchendo E-mail"
    tocar_por_coordenada(540, 1111)
    sleep 1
    fechar_teclado
    sleep 0.5
    $driver.action.send_keys('teste@teste.com').perform
    sleep 1
    fechar_teclado

    puts "📱 Preenchendo Telefone"
    tocar_por_coordenada(540, 1305)
    sleep 1
    fechar_teclado
    sleep 0.5
    $driver.action.send_keys('34999148672').perform
    sleep 1
    fechar_teclado

    puts "🌍 Selecionando Estado"
    tocar_por_coordenada(540, 1180)
    sleep 1
    puts "🖱️ Selecionando Estado por coordenada (MG)"
    tocar_por_coordenada(540, 1240)
    sleep 1

    puts "🌆 Selecionando Cidade"
    tocar_por_coordenada(540, 1903)
    sleep 1

    puts "📍 Selecionando cidade por bounds fixo"
    tocar_por_coordenada(540, 1512) # centro dos bounds [60,1428][1020,1596]
    sleep 1

    puts "⏬ Pulando scroll — acessando Categoria diretamente"
    scroll_para_baixo # caso queira garantir visibilidade
    sleep 1

    puts "📂 Selecionando Categoria"
    tocar_por_coordenada(540, 310)
    sleep 1
    tocar_por_content_desc('Elogio')
    sleep 1

    puts "📚 Selecionando Segmento"
    tocar_por_coordenada(540, 562)
    sleep 1
    tocar_por_content_desc('Administrativo')
    sleep 1

    puts "📌 Selecionando Assunto"
    tocar_por_coordenada(540, 882)
    sleep 1
    tocar_por_content_desc('Atendimento Administrativo (Operadora)')
    sleep 1

    puts "📝 Preenchendo Descrição"
    tocar_por_coordenada(540, 1347)
    sleep 1
    fechar_teclado
    sleep 0.5
    $driver.action.send_keys('TESTE').perform
    sleep 1
    fechar_teclado
  end

  def preencher_ouvidoria
    puts "📥 Acessando Ouvidoria após Home"
    scroll_para_elemento_com_content_desc("Ver\nTodos")
    find_element(accessibility_id: "Ver\nTodos").click
    sleep 2
    scroll_para_baixo
    sleep 1
    tocar_por_coordenada(648, 651)
    sleep 2

    puts "🗣️ Selecionando Ouvidoria"
    tocar_por_coordenada(566, 1933)
    sleep 2

    puts "📟 Preenchendo Último Protocolo"
    tocar_por_coordenada(540, 901)
    sleep 1
    fechar_teclado
    sleep 0.5
    $driver.action.send_keys('007').perform
    sleep 1
    fechar_teclado

    puts "📧 Preenchendo E-mail"
    tocar_por_coordenada(540, 1150)
    sleep 1
    fechar_teclado
    sleep 0.5
    $driver.action.send_keys('teste@teste.com').perform
    sleep 1
    fechar_teclado

    puts "📱 Preenchendo Telefone de Contato"
    tocar_por_coordenada(540, 1305)
    sleep 1
    $driver.action.send_keys('34999148672').perform
    sleep 1
    fechar_teclado
    sleep 1  # ← Aguardando fechamento completo do teclado

    puts "📌 Selecionando Assunto"
    tocar_por_coordenada(540, 1235)  # bounds [63,1159][1017,1312]
    sleep 1
    tocar_por_content_desc('Consulta(Ouvidoria)')
    sleep 1
    fechar_teclado   # ← Garante que o teclado não reabra por acidente
    sleep 1

    puts "📝 Preenchendo Descrição"
    tocar_por_coordenada(540, 1670) # centro de [63,1411][1017,1927]
    sleep 1
    $driver.action.send_keys('TESTE').perform
    sleep 1
fechar_teclado

    puts "📎 Anexando Arquivo"
    tocar_por_content_desc('Anexar arquivo')
    sleep 2
    tocar_por_coordenada(285, 705)
    sleep 2

    puts "📤 Enviando Formulário"
    scroll_para_baixo
    find_element(accessibility_id: 'Enviar').click
    sleep 3

    puts "🔙 Voltando à tela anterior"
    tocar_por_content_desc('Voltar')
  end

  def anexar_arquivo
    puts "📌 Anexando Arquivo"
    tocar_por_content_desc('Anexar arquivo')
    sleep 2
    tocar_por_coordenada(285, 705)
    sleep 2
  end

  def enviar_formulario
    puts "📤 Enviando Formulário"
    scroll_para_baixo
    find_element(accessibility_id: 'Enviar').click
    sleep 3

    puts "📋 Copiando Protocolo"
    tocar_por_coordenada(883, 1782)
    sleep 1
    tocar_por_content_desc('Voltar')
  end

  def scroll_para_elemento_com_content_desc(desc, max_scrolls = 5)
    max_scrolls.times do |i|
      begin
        el = find_element(accessibility_id: desc)
        return if el.displayed?
      rescue Selenium::WebDriver::Error::NoSuchElementError
        puts "🔄 Scroll ##{i + 1} – tentando encontrar '#{desc}'"
        scroll_para_baixo
        sleep 1
      end
    end
    raise "❌ Elemento com content-desc '#{desc}' não encontrado após #{max_scrolls} scrolls."
  end

  def scroll_para_baixo
    puts "📱 Scroll para cima com swipeGesture"
    $driver.execute_script('mobile: swipeGesture', {
      left: 0,
      top: 0,
      width: 1080,
      height: 2076,
      direction: 'up',
      percent: 0.75
    })
    sleep 1
  end

  def tocar_por_content_desc(desc)
    puts "🔎 Tocando no elemento com content-desc: #{desc}"
    find_element(accessibility_id: desc).click
  end

  def tocar_por_coordenada(x, y)
    puts "🖐 Tocando na coordenada: x=#{x}, y=#{y}"
    $driver.execute_script('mobile: clickGesture', { x: x, y: y })
  end
end