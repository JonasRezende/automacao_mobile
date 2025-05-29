require_relative '../support/utils'

class GuiaMedicoScreen < Utils
  def initialize
    @guia_medico_bounds = { x: 540, y: 1360 }
    @caixa_pesquisa_bounds = { x: 540, y: 1707 }
    @telefone_bounds = { x: 165, y: 1936 }
  end

  def acessar_guia_medico
    puts "📚 Acessando Guia Médico"
    tocar_por_coordenada(@guia_medico_bounds[:x], @guia_medico_bounds[:y])
    sleep 2
  end

  def clicar_pesquisar
    puts "🔍 Clicando em PESQUISAR"
    find_element(accessibility_id: "PESQUISAR").click
    sleep 1
  end

  def tocar_caixa_texto
    puts "📝 Tocando na caixa de texto"
    tocar_por_coordenada(@caixa_pesquisa_bounds[:x], @caixa_pesquisa_bounds[:y])
    sleep 1
  end

  def digitar_nome(nome)
    puts "⌨️ Digitando nome: #{nome}"
    campo_texto = find_element(class: "android.widget.EditText")
    campo_texto.click
    campo_texto.send_keys(nome)
    sleep 1
  end

  def clicar_botao_pesquisar
    puts "🔎 Clicando no botão de Pesquisar"
    find_element(accessibility_id: "Pesquisar").click
    sleep 2
  end

  def selecionar_medico
    puts "👨‍⚕️ Selecionando médico Djalma (via bounds)"
    x = (35 + 1045) / 2
    y = (1081 + 1750) / 2
    tocar_por_coordenada(x, y)
    sleep 2
  end

  def clicar_endereco
    puts "📍 Clicando no campo de endereço (posição validada)"
    x = 540
    y = 1934
    tocar_por_coordenada(x, y)
    sleep 2
  end

  def confirmar_modal
    puts "✅ Confirmando modal clicando em 'Sim'"
    begin
      find_element(accessibility_id: "Sim").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "⚠️ Botão 'Sim' não encontrado! Verifique se o modal apareceu corretamente."
    end
    sleep 2
  end

  def fechar_guia
    puts "❌ Fechando guia do médico"
    begin
      find_element(accessibility_id: "Fechar guia").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "⚠️ Botão 'Fechar guia' não encontrado!"
    end
    sleep 2
  end

  def rolar_para_botao_telefone
    puts "📜 Rolando o Bottom Sheet até o botão de telefone"
    2.times do
      scroll_no_bottom_sheet
      sleep 1
    end
  end

  def clicar_telefone
    puts "📞 Tocando no telefone"
    tocar_por_coordenada(@telefone_bounds[:x], @telefone_bounds[:y])
    sleep 1
  end
end
