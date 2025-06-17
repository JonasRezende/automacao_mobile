require_relative '../support/utils'

class FormalDenialScreen
  def initialize
    # Nada necessário no init
  end

  def acessar_formulario
  puts "📜 Acessando botão Ver Todos com scroll"
  scroll_para_elemento_com_content_desc("Ver\nTodos")
  find_element(accessibility_id: "Ver\nTodos").click
  sleep 2

  puts "⏬ Scroll na modal aberta"
  scroll_para_baixo
  sleep 1

  puts "📘 Tocando na funcionalidade de Formal Denial"
  tocar_por_coordenada(400, 651) # ajuste se o botão estiver mais abaixo
  sleep 2
end

  def preencher_formulario
    puts "📄 Preenchendo campo: Escolher Guia"
    tocar_por_coordenada(540, 878)
    sleep 1

    puts "🪪 Selecionando carteirinha"
    tocar_por_coordenada(540, 1765)
    sleep 1

    puts "📧 Preenchendo e-mail"
    tocar_por_coordenada(540, 1157)
    sleep 1
    $driver.action.send_keys('teste@teste.com').perform
    sleep 1
    fechar_teclado

    puts "📱 Preenchendo telefone"
    tocar_por_coordenada(540, 1466)
    sleep 1
    $driver.action.send_keys('34999148672').perform
    sleep 1
    fechar_teclado

    puts "📝 Preenchendo descrição"
    tocar_por_coordenada(540, 1864)
    sleep 1
    $driver.action.send_keys('TESTE').perform
    sleep 1
    fechar_teclado
  end

  def anexar_arquivo
    puts "📎 Clicando no botão Anexar arquivo"
    find_element(accessibility_id: 'Anexar arquivo').click
    sleep 2

    puts "🖼️ Selecionando imagem"
    tocar_por_coordenada(285, 705)
    sleep 2
  end

  def enviar_formulario
    puts "📤 Enviando formulário"
    scroll_para_baixo
    find_element(accessibility_id: 'Enviar').click
    sleep 3

    puts "📋 Copiando protocolo"
    tocar_por_coordenada(883, 1782)
    sleep 1

    puts "🔙 Voltando"
    find_element(accessibility_id: 'Voltar').click
    sleep 1
  end

  # ✅ Scroll funcional com visibilidade por content-desc
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

  def tocar_por_coordenada(x, y)
    puts "👉 Tocando na coordenada: x=#{x}, y=#{y}"
    $driver.execute_script('mobile: clickGesture', {
      x: x,
      y: y,
      elementId: nil
    })
  end

  def fechar_teclado
    puts "🧹 Fechando teclado"
    begin
      $driver.hide_keyboard
    rescue
      puts "⚠️ Teclado já estava fechado"
    end
  end
end
