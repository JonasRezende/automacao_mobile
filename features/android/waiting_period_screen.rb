require_relative '../support/utils'

class WaitingPeriodScreen < Utils
  def wait_for_load(timeout = 10)
    puts "⏳ Aguardando carregamento da tela da Home"
    sleep 2
  end

  def acessar_menu_ver_todos
    puts "📜 Acessando botão VerTodos com scroll e clique por coordenada exata"
    scroll_para_baixo
    tocar_por_coordenada(873, 1853) # centro do bounds [717,1697][1030,2009]
    sleep 2
  end

  def entrar_em_carencias
    puts "📘 Tocando no botão Carências"
    tocar_por_coordenada(399, 1782) # centro do bounds [299,1682][500,1883]
    sleep 2
  end

  def click_content_desc(desc)
    puts "🔙 Clicando em elemento com content-desc: #{desc}"
    find_element(accessibility_id: desc).click
  end
end
