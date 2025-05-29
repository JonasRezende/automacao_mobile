require_relative '../support/utils'

class TaxStatementScreen < Utils
  def initialize
    @demonstrativo_bounds = { x: 540, y: 1763 }
    @pdf_bounds = { x: 968, y: 513 }
    @download_bounds = { x: 1008, y: 156 }
    @botao_salvar_desc = 'Salvar'
    @botao_mais_opcoes_desc = 'Mais opções'
    @botao_baixar_text = 'Baixar'
    @botao_voltar_desc = 'Voltar'
    @permissao_id = 'com.android.packageinstaller:id/permission_allow_button'
  end

  def acessar_demonstrativo_irpf
    puts "📄 Acessando Demonstrativo de IRPF (via coordenadas)"
    tocar_por_coordenada(@demonstrativo_bounds[:x], @demonstrativo_bounds[:y])
    sleep 3
  end

  def aguardar_lista_irpf(timeout = 25)
    puts "⏳ Aguardando lista de Demonstrativos de IRPF carregar..."
    Selenium::WebDriver::Wait.new(timeout: timeout).until do
      elementos = find_elements(:xpath, "//*[@bounds='[926,471][1010,555]']")
      elementos.any?
    end
  rescue
    raise "❌ A lista de Demonstrativos de IRPF não carregou a tempo."
  end

  def clicar_pdf
    aguardar_lista_irpf
    puts "🗂️ Clicando no PDF do Demonstrativo"
    tocar_por_coordenada(@pdf_bounds[:x], @pdf_bounds[:y])
    sleep 2
  end

  def clicar_botao_download
    puts "⬇️ Clicando no botão de Download"
    tocar_por_coordenada(@download_bounds[:x], @download_bounds[:y])
    sleep 2
  end

  def clicar_botao_salvar
    puts "💾 Clicando no botão Salvar"
    find_element(accessibility_id: @botao_salvar_desc).click
    sleep 2
  end

  def permitir_se_solicitar
    puts "🔐 Verificando se há solicitação de permissão..."
    if element_is_present?(@permissao_id)
      puts "🟢 Permissão solicitada, clicando em Permitir"
      find_element(id: @permissao_id).click
    else
      puts "🟡 Nenhuma solicitação de permissão apareceu"
    end
    sleep 2
  end

  def clicar_mais_opcoes
    puts "⚙️ Clicando no botão Mais Opções"
    find_element(accessibility_id: @botao_mais_opcoes_desc).click
    sleep 2
  end

  def clicar_botao_baixar
    puts "⬇️ Procurando e clicando em 'Baixar' no menu"
    begin
      find_element(xpath: "//*[@text='#{@botao_baixar_text}']").click
    rescue
      raise "❌ Não encontrou o botão 'Baixar' no menu"
    end
    sleep 2
  end

  def clicar_voltar
    puts "🔙 Clicando no botão Voltar"
    find_element(accessibility_id: @botao_voltar_desc).click
    sleep 2
  end
end
