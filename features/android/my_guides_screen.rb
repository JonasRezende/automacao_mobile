require_relative '../support/utils'

class MyGuidesScreen < Utils
  def acessar_minhas_guias
    puts "📱 Scrollando e acessando 'Minhas Guias'"
    scroll_para_baixo
    scroll_para_baixo
    find_element(accessibility_id: "Minhas\nGuias").click
  end

def interagir_com_cards
  puts "📂 Tentando expandir e recolher card de guia"

  puts "👉 Tentando tocar para expandir (x: 609, y: 1442)"
  tocar_por_coordenada(609, 1442)
  sleep 2
  puts "🧪 Tocando novamente por segurança"
  tocar_por_coordenada(609, 1442)
  sleep 2

  puts "👈 Tentando tocar para recolher (x: 609, y: 1652)"
  tocar_por_coordenada(609, 1652)
  sleep 2
  puts "🧪 Tocando novamente por segurança"
  tocar_por_coordenada(609, 1652)
  sleep 2

  puts "📜 Acessando histórico da guia"
  tocar_por_coordenada(750, 1108)
  sleep 2

  puts "❌ Fechando histórico"
  find_element(accessibility_id: "Scrim").click
  sleep 2
end

 def aplicar_filtros_status_tipo
  puts "🎯 Aplicando filtros por STATUS"
  %w[Autorizadas Autorizadas\ Parcialmente Em\ análise Não\ Autorizadas].each do |status|
    find_element(accessibility_id: "POR STATUS").click
    sleep 1
    find_element(accessibility_id: status).click
    sleep 2
    find_element(accessibility_id: "POR STATUS").click
    sleep 1
  end

  puts "🎯 Aplicando filtros por TIPO"

  # Consultas
  find_element(accessibility_id: "POR TIPO").click
  sleep 1
  find_element(accessibility_id: "Consultas").click
  sleep 3

  puts "👉 Expandindo card após filtro Consultas"
  tocar_por_coordenada(609, 1442)
  sleep 2
  puts "👈 Recolhendo card após filtro Consultas"
  tocar_por_coordenada(609, 1592)
  sleep 2

  find_element(accessibility_id: "POR TIPO").click
  sleep 1

  # Exames e Procedimentos
  find_element(accessibility_id: "POR TIPO").click
  sleep 1
  find_element(accessibility_id: "Exames e Procedimentos").click
  sleep 3

  puts "👉 Expandindo card após filtro Exames e Procedimentos"
  tocar_por_coordenada(609, 1442)
  sleep 2
  puts "👈 Recolhendo card após filtro Exames e Procedimentos"
  tocar_por_coordenada(609, 1652)
  sleep 2

  find_element(accessibility_id: "POR TIPO").click
  sleep 1

  # Internações
  find_element(accessibility_id: "POR TIPO").click
  sleep 1
  find_element(accessibility_id: "Internações").click
  sleep 3
  find_element(accessibility_id: "POR TIPO").click
  sleep 1
end

  def aplicar_filtro_numero_guia(numero)
    puts "🔎 Filtrando por número da guia: #{numero}"
    find_element(accessibility_id: "FILTRAR POR GUIA").click
    sleep 1
    tocar_por_coordenada(540, 1707) # Campo texto
    sleep 1
    send_text(numero)
    sleep 1
    find_element(accessibility_id: "Pesquisar").click
    sleep 2
  end

  def aplicar_filtro_data(inicio:, fim:)
    puts "📅 Aplicando filtro de data: #{inicio} até #{fim}"
    tocar_por_coordenada(987, 144) # Abrir calendário
    sleep 1
    tocar_por_coordenada(984, 324) # Lápis
    sleep 1

    tocar_por_coordenada(324, 750) # Data início
    send_text(inicio)
    sleep 1

    tocar_por_coordenada(756, 750) # Data fim
    send_text(fim)
    sleep 1

    tocar_por_coordenada(912, 975) # OK
    sleep 2

    tocar_por_coordenada(987, 144) # Fechar calendário
    sleep 2
  end
end
