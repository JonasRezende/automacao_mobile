require_relative '../support/utils'

class ConsultBillsScreen < Utils
  def acessar_menu_boletos
  puts '🧾 Acessando menu de boletos'
  scroll_para_baixo
  tocar_por_coordenada(540, 1853) # centro do bounds [384,1697][696,2009]
  sleep 5
    end
  def aplicar_filtros_boletos
    puts '🎯 Aplicando filtros'
    tocar_por_coordenada(200, 534) # Filtro "À VENCER"
    sleep 1
    tocar_por_coordenada(800, 534) # Filtro "VENCIDOS"
    sleep 1
    try_xpath_click_by_content_desc('VER TODOS')
    sleep 2
  end

  def copiar_codigo_e_visualizar
    puts '📋 Copiando código de barras e visualizando boleto'
    try_xpath_click_by_content_desc('Código de barras')
    sleep 1
    try_xpath_click_by_content_desc('Visualizar boleto')
    sleep 8 # espera pelo carregamento
  end

  def baixar_boleto
    puts '⬇️ Baixando boleto'
    tocar_por_coordenada(1000, 156) # botão download
    sleep 2
    try_xpath_click_by_content_desc('Salvar')
    sleep 2
    try_xpath_click_by_content_desc('Mais opções')
    sleep 1
    tocar_por_coordenada(800, 470) # botão Baixar no menu
    sleep 1
  end

  def voltar_tela_inicial
    puts '🔙 Voltando até a home'
    3.times do
      begin
        try_xpath_click_by_content_desc('Voltar')
        sleep 1
      rescue
        puts '⚠️ Botão voltar não encontrado, ignorando'
      end
    end
  end
end
