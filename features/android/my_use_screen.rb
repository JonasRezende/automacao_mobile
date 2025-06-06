require_relative '../support/utils'

class MinhasUtilizacoesScreen < Utils
  def initialize
    @botao_utilizacoes_bounds = { x: 206, y: 1763 }
    @botao_pdf_bounds = { x: (913 + 997) / 2, y: (519 + 603) / 2 }
    @botao_download_bounds = { x: (936 + 1080) / 2, y: (84 + 228) / 2 }
    @botao_salvar_desc = "Salvar"
    @botao_mais_opcoes_desc = "Mais opções"
    @botao_voltar_desc = "Voltar"
  end

  def acessar_minhas_utilizacoes
    puts "📄 Acessando Minhas Utilizações"
    tocar_por_coordenada(@botao_utilizacoes_bounds[:x], @botao_utilizacoes_bounds[:y])
    sleep 3
  end

  def clicar_pdf_utilizacao
    puts "🗂️ Aguardando PDF da utilização aparecer"
    wait(10) { elemento_presente_por_bounds?(@botao_pdf_bounds[:x], @botao_pdf_bounds[:y]) }

    puts "🗂️ Clicando no PDF da utilização"
    tocar_por_coordenada(@botao_pdf_bounds[:x], @botao_pdf_bounds[:y])
    sleep 2
  end

  def clicar_botao_download
    puts "⬇️ Clicando no botão de Download"
    tocar_por_coordenada(@botao_download_bounds[:x], @botao_download_bounds[:y])
    sleep 2
  end

  def clicar_botao_salvar
    puts "💾 Clicando no botão Salvar"
    begin
      find_element(accessibility_id: @botao_salvar_desc).click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "⚠️ Botão 'Salvar' não encontrado!"
    end
    sleep 2
  end

  def clicar_mais_opcoes
    puts "⚙️ Clicando no botão Mais Opções"
    begin
      find_element(accessibility_id: @botao_mais_opcoes_desc).click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "⚠️ Botão 'Mais opções' não encontrado!"
    end
    sleep 2
  end

  def clicar_botao_baixar
    puts "⬇️ Clicando no botão 'Baixar'"
    tocar_por_coordenada(752, 468)
    sleep 2
  end

  def clicar_voltar
    puts "🔙 Clicando no botão Voltar"
    begin
      find_element(accessibility_id: @botao_voltar_desc).click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "⚠️ Botão 'Voltar' não encontrado!"
    end
    sleep 2
  end

  private

  def elemento_presente_por_bounds?(x, y)
    $driver.action.move_to(location: { x: x, y: y }).perform
    true
  rescue
    false
  end
end
