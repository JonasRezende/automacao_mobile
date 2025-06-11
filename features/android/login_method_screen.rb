class LoginScreen < Utils
  def initialize
    @select_access_type = 'Selecione uma opção'
    @access_client = 'Acesso Cliente'
    @access_app = 'Acessar o aplicativo'
    @enable_card = 'Habilitar'
    @disable_card = 'Não habilitar'
    @cancel_button = 'Cancelar'

    # Carteirinha padrão (para os fluxos normais)
    @default_card_option = 'REG-PP-PJ-AMBHOSP-OBST-RB-E-PART-UNICOS-COLABORADOR-UNIMED'
    # Carteirinha específica para IRPF
    @irpf_card_option = 'REG-AD-PJ-AMBHOSP-OBST-RB-A-PARTICIPATIVO-PLAC'

    # Coordenadas dos campos
    @cpf_bounds = { x: 540, y: 1600 }
    @password_bounds = { x: 540, y: 1606 }
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
    sleep 3
  end

  def fill_cpf(cpf)
    puts "👉 Tocando no campo CPF"
    esperar_edit_text(timeout: 5)
    tocar_por_coordenada(@cpf_bounds[:x], @cpf_bounds[:y])
    sleep 1

    puts "⌨️ Digitando CPF: #{cpf}"
    $driver.action.send_keys(cpf).perform
    sleep 1

    fechar_teclado
    tocar_por_coordenada(@enter_bounds[:x], @enter_bounds[:y])
    sleep 2
  end

  def fill_password(password)
    puts "👉 Tocando no campo Senha"
    esperar_edit_text(timeout: 5)
    tocar_por_coordenada(@password_bounds[:x], @password_bounds[:y])
    sleep 1

    puts "🔐 Digitando Senha"
    campos = find_elements(:class, 'android.widget.EditText')
    raise "❌ Campo de senha não encontrado" if campos.size < 2
    campos[1].send_keys(password)

    fechar_teclado
    tocar_por_coordenada(@enter_bounds[:x], @enter_bounds[:y])
    sleep 2
  end

  # Seleciona carteirinha padrão (fluxo normal)
  def select_card
    selecionar_carteirinha_por(@default_card_option)
  end

  # Seleciona carteirinha específica para IRPF
  def select_card_irpf
    selecionar_carteirinha_por(@irpf_card_option)
  end

  # NOVO MÉTODO: Seleciona carteirinha ou beneficiário pela descrição
  def select_card_by_description(description)
    selecionar_carteirinha_por(description)
  end

  def cancel_card_selection
    find_element(accessibility_id: @cancel_button).click
  end

  def enable_card
    find_element(accessibility_id: @enable_card).click
  end

  def disable_card
    find_element(accessibility_id: @disable_card).click
    sleep 2
  end

  private

  def selecionar_carteirinha_por(card_option)
    puts "🪪 Aguardando a carteirinha: #{card_option}"
    wait_for_element_partial_desc(card_option, 15)
    sleep 2

    elementos = find_elements(:xpath, "//*[contains(@content-desc, '#{card_option}')]")
    raise "❌ Carteirinha não encontrada: #{card_option}" if elementos.empty?

    puts "✅ Clicando na carteirinha encontrada"
    elementos.first.click
  end

  def esperar_edit_text(timeout: 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      !find_elements(:class, 'android.widget.EditText').empty?
    }
  rescue
    raise "❌ Campo de texto não encontrado após #{timeout}s."
  end

  def wait_for_element_partial_desc(text, timeout = 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      find_elements(:xpath, "//*[contains(@content-desc, '#{text}')]").any?
    }
  end

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

  def fechar_teclado
    begin
      $driver.hide_keyboard
    rescue
      puts "⚠️ Teclado já estava fechado"
    end
  end
end