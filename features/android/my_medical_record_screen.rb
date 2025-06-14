require_relative '../support/utils'

class MedicalRecordScreen < Utils
  def wait_for_load(timeout = 10)
    puts "⏳ Aguardando carregamento da tela do Prontuário"
    sleep 2
  end

  def acessar_menu_ver_todos
    puts "📜 Acessando botão VerTodos com scroll e clique por coordenada exata"
    scroll_para_baixo
    tocar_por_coordenada(873, 1853) # centro do bounds [717,1697][1030,2009]
    sleep 2
  end

  def entrar_no_registro_medico
    puts "📘 Tocando no botão de entrada do prontuário"
    tocar_por_coordenada(150, 1782) # centro do bounds [50,1682][251,1883]
    sleep 2
  end

  def click_content_desc(desc)
    puts "🔎 Clicando no elemento com content-desc: #{desc}"
    find_element(accessibility_id: desc).click
  end

  def tap_bounds(x1, y1, x2, y2)
    center_x = (x1 + x2) / 2
    center_y = (y1 + y2) / 2
    puts "👆 Tocando nas coordenadas centralizadas: (#{center_x}, #{center_y})"
    tocar_por_coordenada(center_x, center_y)
  end

  def type_search(text)
    puts "⌨️ Digitando no campo de busca: #{text}"
    find_element(class: 'android.widget.EditText').send_keys(text)
  end

  def type_raw(text)
    puts "⌨️ Enviando texto cru: #{text}"
    $driver.action.send_keys(text).perform
  end
end
