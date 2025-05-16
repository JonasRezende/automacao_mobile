# Classe com métodos úteis para reutilizar em todo o projeto
class Utils

  # Espera até que um elemento apareça na tela, podendo ser por :id, :accessibility_id ou :xpath
  def wait_for_element(element, timeout, locator_type = :id)
    wait = Selenium::WebDriver::Wait.new timeout: timeout

    wait.until do
      begin
        case locator_type
        when :id
          find_element(id: element).displayed?
        when :accessibility_id
          find_element(accessibility_id: element).displayed?
        when :xpath
          find_element(xpath: element).displayed?
        else
          raise "Tipo de localização não suportado: #{locator_type}"
        end
      rescue Selenium::WebDriver::Error::NoSuchElementError
        false
      end
    end
  end

  # Simula o gesto de arrastar a tela para cima
  def scroll_down
    size = $driver.window_size

    $driver.execute_script('mobile: swipeGesture', {
      left: 0,
      top: size['height'] * 0.6,
      width: size['width'],
      height: size['height'] * 0.4,
      direction: 'up',
      percent: 0.8
    })
  end

  # Clica em um elemento com ID
  def click_in_element(element, timeout)
    wait_for_element(element, timeout, :id)
    find_element(id: element).click
  end

  # Digita um valor em um campo (usando ID)
  def type_text(element, value, timeout)
    wait_for_element(element, timeout, :id)
    campo = find_element(:id, element)
    campo.clear
    campo.send_keys(value)
  end

  # Retorna o texto visível de um elemento
  def get_text(element)
    find_element(id: element).text
  end

  # Limpa o conteúdo de um campo
  def clear_fields(id)
    find_element(:id, id).clear
  end

  # Aceita um alerta (por exemplo, "Deseja sair?")
  def accept_alert
    $driver.switch_to.alert.accept
  end

  # Verifica se um elemento com determinado ID está presente na tela
  def element_is_present?(element)
    find_elements(:id, element).size > 0
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

end
