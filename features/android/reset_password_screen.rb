class ResetPasswordScreen < Utils
  def initialize
    @perfil_bounds = { x: 995, y: 156 }
    @senha_atual = { x: 540, y: 398 }     # bounds: [63,320][1017,476]
    @nova_senha = { x: 540, y: 590 }      # bounds: [63,512][1017,668]
    @confirmar_senha = { x: 540, y: 782 } # bounds: [63,704][1017,860]
    @foto_perfil = { x: 705, y: 672 }     # bounds para clicar na imagem de perfil
    @imagem_para_selecionar = { x: 285, y: 705 } # bounds da imagem na galeria
  end

  def acessar_resetar_senha
    puts "👤 Acessando opções de perfil"
    tocar_por_coordenada(@perfil_bounds[:x], @perfil_bounds[:y])
    sleep 2

    puts "🔐 Clicando em 'Redefinir senha'"
    wait_for_element('Redefinir senha', 10, :accessibility_id)
    find_element(accessibility_id: 'Redefinir senha').click
    sleep 2
  end

  def redefinir_senha
    puts "🔑 Preenchendo senha atual"
    tocar_por_coordenada(@senha_atual[:x], @senha_atual[:y])
    sleep 1
    $driver.action.send_keys("unimed21").perform
    sleep 1

    puts "🆕 Preenchendo nova senha"
    tocar_por_coordenada(@nova_senha[:x], @nova_senha[:y])
    sleep 1
    $driver.action.send_keys("Unimed@2025").perform
    sleep 1

    puts "🔁 Confirmando nova senha"
    tocar_por_coordenada(@confirmar_senha[:x], @confirmar_senha[:y])
    sleep 1
    $driver.action.send_keys("Unimed@2025").perform

    fechar_teclado
    sleep 1

    puts "💾 Salvando nova senha"
    wait_for_element('Salvar', 10, :accessibility_id)
    find_element(accessibility_id: 'Salvar').click
    sleep 2

    puts "🔙 Voltando para a tela inicial"
    wait_for_element('Voltar ao início', 10, :accessibility_id)
    find_element(accessibility_id: 'Voltar ao início').click
    sleep 2
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

  def fechar_teclado
    begin
      $driver.hide_keyboard
    rescue
      puts "⚠️ Teclado já estava fechado ou não foi possível ocultá-lo."
    end
  end
end
