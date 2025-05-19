require_relative '../support/utils'

class GuiaMedicoScreen < Utils
  def initialize
    @guia_medico_bounds = { x: 540, y: 1360 } # centro de [0,1158][1080,1563]
    @caixa_pesquisa_bounds = { x: 540, y: 1707 } # centro de [50,1629][1030,1785]
    @telefone_bounds = { x: 165, y: 1936 } # centro de [54,1893][276,1980]
  end

  # Acessa o Guia Médico via coordenadas
  def acessar_guia_medico
    puts "📚 Acessando Guia Médico"
    tocar_por_coordenada(@guia_medico_bounds[:x], @guia_medico_bounds[:y])
    sleep 2
  end

  # Clica no botão PESQUISAR da tela Guia Médico
  def clicar_pesquisar
    puts "🔍 Clicando em PESQUISAR"
    find_element(accessibility_id: "PESQUISAR").click
    sleep 1
  end

  # Toca na caixa de texto de busca (via coordenada)
  def tocar_caixa_texto
    puts "📝 Tocando na caixa de texto"
    tocar_por_coordenada(@caixa_pesquisa_bounds[:x], @caixa_pesquisa_bounds[:y])
    sleep 1
  end

  # Digita o nome do médico no campo de busca
  def digitar_nome(nome)
    puts "⌨️ Digitando nome: #{nome}"

    campo_texto = find_element(class: "android.widget.EditText")
    campo_texto.click
    campo_texto.send_keys(nome)

    sleep 1
  end

  # Clica no botão de buscar médico (após preencher o nome)
  def clicar_botao_pesquisar
    puts "🔎 Clicando no botão de Pesquisar"
    find_element(accessibility_id: "Pesquisar").click
    sleep 2
  end

  # Seleciona o médico desejado (via coordenadas do card)
  def selecionar_medico
    puts "👨‍⚕️ Selecionando médico Djalma (via bounds)"

    # Centro do card: [35,1081][1045,1750]
    x = (35 + 1045) / 2  # => 540
    y = (1081 + 1750) / 2  # => 1415

    tocar_por_coordenada(x, y)
    sleep 2

    # Rola a tela após abrir o card, para garantir visibilidade dos campos
    puts "📜 Rolando a tela após abrir o card"
    scroll_para_baixo
    sleep 1
  end

  # Toca no campo de endereço (via coordenadas calculadas)
  def clicar_endereco
    puts "📍 Tocando no campo de endereço (via coordenadas)"

    # Centro dos bounds: [54,1930][1026,2068]
    x = (54 + 1026) / 2  # => 540
    y = (1930 + 2068) / 2  # => 1999

    tocar_por_coordenada(x, y)
    sleep 2
  end

  # Clica no botão "Sim" do modal que aparece após tocar no endereço ou telefone
  def confirmar_modal
    puts "✅ Confirmando modal clicando em 'Sim'"

    begin
      find_element(accessibility_id: "Sim").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "⚠️ Botão 'Sim' não encontrado! Verifique se o modal apareceu corretamente."
    end

    sleep 2
  end

  # Fecha o navegador externo (após abrir link do endereço)
  def fechar_navegador
    puts "❌ Fechando navegador"
    find_element(id: "close_button").click
    sleep 2
  end

  # Realiza scroll vertical até o fim da tela (ajustável)
  def rolar_ate_o_fim
    puts "📜 Rolando até o final da tela"
    2.times do
      scroll_para_baixo
      sleep 1
    end
  end

  # Toca no número de telefone exibido no card
  def clicar_telefone
    puts "📞 Tocando no telefone"
    tocar_por_coordenada(@telefone_bounds[:x], @telefone_bounds[:y])
    sleep 1
  end
end
