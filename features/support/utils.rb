class Utils
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

  def click_in_element(element, timeout)
    wait_for_element(element, timeout, :id)
    find_element(id: element).click
  end

  def get_text(element)
    find_element(id: element).text
  end

  def clear_fields(id)
    find_element(:id, id).clear
  end

  def accept_alert
    $driver.switch_to.alert.accept
  end

  def element_is_present?(element)
    find_elements(:id, element).size > 0
  end

  def esperar_edit_text(timeout: 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until do
      edit_texts = find_elements(:class, 'android.widget.EditText')
      !edit_texts.empty?
    end
  rescue
    raise "❌ Campo de texto não encontrado após #{timeout}s."
  end

  def wait_for_element_partial_desc(text, timeout = 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      find_elements(:xpath, "//*[contains(@content-desc, '#{text}')]").any?
    }
  end

  def scroll_para_baixo
    puts "📱 Scroll manual por coordenadas"
    $driver.execute_script('mobile: swipeGesture', {
      left: 0,
      top: 0,
      width: 1080,
      height: 2076,
      direction: 'up',
      percent: 0.85
    })
    sleep 2
  end

  def send_text(texto)
    puts "⌨️ Digitando: #{texto}"
    $driver.execute_script 'mobile: type', { text: texto }
  end

  def try_xpath_click_by_content_desc(content_desc)
    puts "🔍 Procurando e clicando no content-desc: #{content_desc}"
    begin
      elemento = find_element(:xpath, "//*[@content-desc='#{content_desc}']")
      elemento.click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      raise "❌ Elemento com content-desc '#{content_desc}' não encontrado."
    end
  end
end
