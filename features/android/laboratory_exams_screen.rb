class LaboratoryExamsScreen
  def initialize
    @utils = Utils.new
  end

  def access_laboratory_exams
    puts "📱 Acessando Exames Laboratoriais"
    @utils.scroll_para_baixo

    puts "🔍 Tentando clicar no botão 'Exames Laboratoriais' via XPath"
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until do
      elements = $driver.find_elements(xpath: "//*[@content-desc[contains(., 'Exames') and contains(., 'Laboratoriais')]]")
      if elements.any?
        elements.first.click
        true
      else
        false
      end
    end
  end

  def abrir_mais_informacoes
    puts "ℹ️ Aguardando exames aparecerem..."
    sleep 5
    puts "ℹ️ Abrindo mais informações do exame"
    @utils.tocar_por_coordenada(610, 780) # Centro do bounds: [260,753][959,808]
    sleep 2
  end

  def open_pdf_exam
    puts "📄 Abrindo PDF do exame"
    @utils.tocar_por_coordenada(962, 657) # Centro do bounds: [914,609][1010,705]
    $driver.find_element(accessibility_id: 'PDF_02').click
    sleep 5
  end

  def download_pdf_exam
    puts "⬇️ Iniciando download do PDF"
    @utils.tocar_por_coordenada(1008, 156) # Botão download
    $driver.find_element(accessibility_id: 'Salvar').click
    $driver.find_element(accessibility_id: 'Mais opções').click

    puts "🔽 Clicando no botão 'Baixar' por texto"
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until do
      elements = $driver.find_elements(xpath: "//*[@text='Baixar']")
      if elements.any?
        elements.first.click
        true
      else
        false
      end
    end

    sleep 2
  end

  def go_back
    puts "🔙 Voltando"
    $driver.find_element(accessibility_id: 'Voltar').click
    sleep 2
  end
end
