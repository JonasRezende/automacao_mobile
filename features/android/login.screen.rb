class LoginScreen < Utils
  def initialize
    @select_access_type = 'Selecione uma opção'
    @access_client = 'Acesso Cliente'
    @access_app = 'Acessar o aplicativo'
    @enable_card = 'Habilitar'
    @disable_card = 'Não habilitar'
    @cancel_button = 'Cancelar'
    @card_option = 'REG-PP-PJ-AMBHOSP-OBST-RB-E-PART-UNICOS-COLABORADOR-UNIMED'

    # Coordenadas dos elementos clicáveis
    @cpf_bounds = { x: 540, y: 1600 }
    @password_bounds = { x: 540, y: 1606 } # baseado nos bounds [63,1528][1017,1684]
    @enter_bounds = { x: 958, y: 1953 }
  end

  def open_access_options
    wait_for_element(@select_access_type, 15, :accessibility_id)
    find_element(accessibility_id: @select_access_type).click
  end

  def choose_client_access
    wait_for_element(@access_client, 10, :accessibility_id)
    find_element(accessibility_id: @access_client).click
  end

  def access_app
    wait_for_element(@access_app, 10, :accessibility_id)
    find_element(accessibility_id: @access_app).click
    sleep 3 # aguarda transição para a tela de login
  end

  def fill_cpf(cpf)
    puts "⏳ Esperando campo CPF aparecer..."
    esperar_edit_text(timeout: 5)

    puts "👉 Tocando no campo CPF (coordenadas)"
    tocar_por_coordenada(@cpf_bounds[:x], @cpf_bounds[:y])
    sleep 1

    puts "⌨️ Digitando CPF: #{cpf}"
    $driver.action.send_keys(cpf).perform
    sleep 1

    puts "🧹 Fechando teclado para liberar botão ENTER"
    begin
      $driver.hide_keyboard
    rescue
      puts "⚠️ Teclado já estava fechado"
    end
    sleep 1

    puts "✅ Tocando no botão ENTER (para exibir o campo senha)"
    tocar_por_coordenada(@enter_bounds[:x], @enter_bounds[:y])
    sleep 2
  end

  def fill_password(password)
    puts "🕓 Esperando campo de senha carregar..."
    esperar_edit_text(timeout: 5)

    puts "👉 Tocando no campo Senha (coordenadas)"
    tocar_por_coordenada(@password_bounds[:x], @password_bounds[:y])
    sleep 1

    puts "🔐 Digitando Senha"
    begin
      campos = find_elements(:class, 'android.widget.EditText')
      raise "❌ Campo de senha não encontrado na lista de EditTexts." if campos.size < 2

      campo_senha = campos[1]
      campo_senha.send_keys(password)
    rescue => e
      raise "❌ Erro ao tentar digitar a senha: #{e.message}"
    end

    puts "🧹 Fechando teclado para liberar botão ENTER"
    begin
      $driver.hide_keyboard
    rescue
      puts "⚠️ Teclado já estava fechado"
    end
    sleep 1

    puts "✅ Tocando no botão ENTER (para efetuar login)"
    tocar_por_coordenada(@enter_bounds[:x], @enter_bounds[:y])
    sleep 2
  end

  # 🪪 Seleciona uma carteirinha após o login
  def select_card
    puts "🪪 Aguardando a carteirinha aparecer..."
    wait_for_element_partial_desc(@card_option, 15)

    sleep 2 # ⏳ tempo adicional para estabilidade da UI

    puts "✅ Buscando elemento da carteirinha na tela..."
    begin
      elementos = find_elements(:xpath, "//*[contains(@content-desc, '#{@card_option}')]")

      if elementos.empty?
        raise "❌ Nenhuma carteirinha encontrada com o content-desc esperado."
      end

      puts "🟢 Clicando na primeira carteirinha encontrada..."
      elementos.first.click
    rescue => e
      puts "❌ Erro ao tentar clicar na carteirinha: #{e.message}"
      raise "Erro ao selecionar carteirinha: #{e.message}"
    end
  end

  def cancel_card_selection
    puts "Cancelando seleção de carteirinha"
    find_element(accessibility_id: @cancel_button).click
  end

  def enable_card
    puts "Clicando em Habilitar"
    find_element(accessibility_id: @enable_card).click
  end

  def disable_card
    puts "Clicando em Não Habilitar"
    find_element(accessibility_id: @disable_card).click
    sleep 2  # ⏳ Dá tempo da interface carregar a carteirinha antes de tentar clicar
  end

  # 🔧 Toque absoluto por coordenada (sem associar a elementos)
  def tocar_por_coordenada(x, y)
    puts "Tocando na coordenada: x=#{x}, y=#{y}"
    $driver.execute_script('mobile: clickGesture', {
      x: x,
      y: y,
      elementId: nil
    })
  end

  # 🔍 Espera um campo EditText (input) ser visível
  def esperar_edit_text(timeout: 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until do
      edit_texts = find_elements(:class, 'android.widget.EditText')
      !edit_texts.empty?
    end
  rescue
    raise "❌ Campo de texto não encontrado após #{timeout}s."
  end

  # 🔍 Aguarda um elemento com parte do content-desc visível
  def wait_for_element_partial_desc(text, timeout = 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      find_elements(:xpath, "//*[contains(@content-desc, '#{text}')]").any?
    }
  end

  # 🔍 Espera qualquer elemento com :id ou :accessibility_id visível
  def wait_for_element(id, timeout = 10, type = :accessibility_id)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      case type
      when :accessibility_id
        find_element(accessibility_id: id).displayed?
      when :id
        find_element(id: id).displayed?
      when :xpath
        find_element(xpath: id).displayed?
      end
    }
  end
end
