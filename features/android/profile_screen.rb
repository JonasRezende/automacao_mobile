# Arquivo: features/android/profile_screen.rb

require_relative '../support/utils'

class ProfileScreen < Utils
  attr_reader :meu_perfil_menu_item_id

  def initialize
    super
    @meu_perfil_menu_item_id = 'Meu perfil'

    @telefone1_x = 540
    @telefone1_y = 449

    @telefone2_x = 540
    @telefone2_y = 697

    @email_x     = 540
    @email_y     = 946

    @genero_x    = 540
    @genero_y    = 1195

    @sexo_x      = 540
    @sexo_y      = 1444

    @voltar_inicio_x = 540
    @voltar_inicio_y = 1924
  end

  def acessar_perfil
    puts "👤 Acessando Meu Perfil"

    tentativas = 0
    max_tentativas = 3

    until element_exists?(:xpath, "//*[@text='#{@meu_perfil_menu_item_id}']", 5) || tentativas >= max_tentativas
      puts "🕒 Tentativa #{tentativas + 1} para exibir 'Meu perfil'"
      puts "🖐 Tocando na coordenada de perfil (995,156)"
      tocar_por_coordenada(995, 156)
      sleep 2
      tentativas += 1
    end

    if element_exists?(:accessibility_id, @meu_perfil_menu_item_id, 5)
      puts "✅ 'Meu perfil' visível como accessibility_id. Clicando..."
      find_element(accessibility_id: @meu_perfil_menu_item_id).click
    elsif element_exists?(:xpath, "//*[@text='#{@meu_perfil_menu_item_id}']", 5)
      puts "✅ 'Meu perfil' visível como texto (XPath). Clicando..."
      find_element(xpath: "//*[@text='#{@meu_perfil_menu_item_id}']").click
    else
      raise "❌ Não foi possível acessar 'Meu perfil' após #{tentativas} tentativas"
    end

    sleep 1
  end

  def editar_informacoes_pessoais
    # (método inalterado)
  end

  def clicar_voltar_ao_inicio
    puts "🔙 Tentando clicar no botão 'Voltar ao início'"
    begin
      wait_for_element('Voltar ao início', 8, :accessibility_id)
      puts "✅ Clicando via accessibility_id"
      find_element(accessibility_id: 'Voltar ao início').click
    rescue
      puts "⚠️ Tentando coordenada: x=#{@voltar_inicio_x}, y=#{@voltar_inicio_y}"
      tocar_por_coordenada(@voltar_inicio_x, @voltar_inicio_y)
    end
    sleep 2
  end

  def acessar_informacoes_contrato
    puts "📃 Acessando Informações do contrato"

    begin
      wait_for_element('Informações do Contrato', 10, :accessibility_id)
      find_element(accessibility_id: 'Informações do Contrato').click
      sleep 2

      puts "🔙 Clicando no botão 'Voltar' da interface"
      wait_for_element('Voltar', 10, :accessibility_id)
      find_element(accessibility_id: 'Voltar').click
      sleep 2

      puts "👉 Acessando Gerenciar Acessos"
      wait_for_element('Gerenciar Acessos', 10, :accessibility_id)
      find_element(accessibility_id: 'Gerenciar Acessos').click
      sleep 2

      puts "✅ Tela de Gerenciar Acessos acessada com sucesso"

    rescue => e
      raise "❌ Erro ao acessar Informações do Contrato ou Gerenciar Acessos: #{e.message}"
    end
  end

  def gerenciar_acessos
    puts "🔐 Gerenciando acessos"

    # Toca no botão OK (não confia no accessibility_id por instabilidade)
    puts "🖐 Clicando no botão OK (coordenada)"
    tocar_por_coordenada(540, 1221)
    sleep 2

    # Toca no interruptor (posição estimada)
    puts "🖐 Tocando no interruptor (posição estimada)"
    tocar_por_coordenada(140, 760)
    sleep 2

    # Toca no segundo botão OK, se ele aparecer
    puts "🖐 Clicando novamente no botão OK (coordenada)"
    tocar_por_coordenada(540, 1221)
    sleep 2

    # Volta para a tela anterior
    wait_for_element('Voltar', 10, :accessibility_id)
    find_element(accessibility_id: 'Voltar').click
    sleep 1
  end

def alterar_foto_perfil
  puts "🖼️ Alterando foto do perfil"

  # 1. Clicar no botão de editar a foto (bounds = [678,644][732,701] → centro = 705,672)
  puts "👉 Tocando no botão de editar foto"
  tocar_por_coordenada(705, 672)
  sleep 2

  # 2. Selecionar a opção "Galeria"
  begin
    puts "🗂️ Selecionando 'Galeria'"
    wait_for_element('Galeria', 10, :accessibility_id)
    find_element(accessibility_id: 'Galeria').click
  rescue => e
    puts "⚠️ Não encontrou 'Galeria': #{e.message}"
    return
  end
  sleep 2

  # 3. Escolher a imagem (bounds = [48,468][522,942] → centro = 285,705)
  puts "🖼️ Selecionando imagem na galeria"
  tocar_por_coordenada(285, 705)
  sleep 2

  # 4. Clicar no botão "Salvar"
  begin
    puts "💾 Clicando no botão 'Salvar'"
    wait_for_element('Salvar', 10, :accessibility_id)
    find_element(accessibility_id: 'Salvar').click
  rescue => e
    puts "⚠️ Não conseguiu clicar no botão 'Salvar': #{e.message}"
    return
  end
  sleep 2

  # 5. Confirmar com botão "OK"
  begin
    puts "✅ Confirmando com botão 'OK'"
    wait_for_element('OK', 10, :accessibility_id)
    find_element(accessibility_id: 'OK').click
  rescue => e
    puts "⚠️ Botão 'OK' não apareceu: #{e.message}"
  end
  sleep 2

  # 6. Voltar à tela anterior
  begin
    puts "🔙 Clicando no botão 'Voltar'"
    wait_for_element('Voltar', 10, :accessibility_id)
    find_element(accessibility_id: 'Voltar').click
  rescue => e
    puts "⚠️ Não conseguiu voltar: #{e.message}"
  end

  sleep 1
end

  private

  def wait_for_element(id, timeout = 10, type = :accessibility_id)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      case type
      when :accessibility_id then find_element(accessibility_id: id).displayed?
      when :id then find_element(id: id).displayed?
      when :xpath then find_element(xpath: id).displayed?
      end
    }
  end

  def element_exists?(type, locator, timeout = 1)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      case type
      when :accessibility_id then find_element(accessibility_id: locator).displayed?
      when :id then find_element(id: locator).displayed?
      when :xpath then find_element(xpath: locator).displayed?
      else false
      end
    }
  rescue
    false
  end

  def fechar_teclado
    $driver.hide_keyboard
    puts "✅ Teclado virtual ocultado."
  rescue
    puts "⚠️ Teclado já estava fechado ou não foi possível ocultá-lo."
  end
end
