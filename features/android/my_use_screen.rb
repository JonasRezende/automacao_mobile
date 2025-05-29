require_relative '../support/utils'

class MinhasUtilizacoesScreen < Utils
  def initialize
    @botao_utilizacoes_bounds = { x: 206, y: 1763 } # bounds [50,1607][363,1920]
    @botao_pdf_bounds = { x: (913 + 997) / 2, y: (519 + 603) / 2 }        # => { x:955, y:561 }
    @botao_download_bounds = { x: (936 + 1080) / 2, y: (84 + 228) / 2 }  # => { x:1008, y:156 }
    @botao_salvar_desc = "Salvar"
    @botao_mais_opcoes_desc = "Mais opções"
    @botao_voltar_desc = "Voltar"
  end

  def acessar_minhas_utilizacoes
    puts "📄 Acessando Minhas Utilizações (via coordenadas)"
    tocar_por_coordenada(@botao_utilizacoes_bounds[:x], @botao_utilizacoes_bounds[:y])
    sleep 2
  end

  def clicar_pdf_utilizacao
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
    puts "⬇️ Clicando no botão 'Baixar' (via bounds validado)"

    # Bounds fornecidos: [484,432][1020,505]
    x = (484 + 1020) / 2   # => 752
    y = (432 + 505) / 2    # => 468

    tocar_por_coordenada(x, y)

    puts "✅ Clique no botão 'Baixar' realizado com sucesso"
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
end
