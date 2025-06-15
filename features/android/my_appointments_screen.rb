require_relative '../support/utils'

class MyAppointmentsScreen < Utils
  def wait_for_load(timeout = 10)
    puts "Aguardando carregamento da tela de Agendamentos"
    sleep 2
  end

  def acessar_menu_ver_todos
    puts "Acessando botão VerTodos com scroll e clique por coordenada"
    scroll_para_baixo
    tocar_por_coordenada(873, 1853)
    sleep 2
  end

  def entrar_em_meus_agendamentos
    puts "Entrando em Meus Agendamentos"
    tocar_por_coordenada(651, 1782)
    sleep 2
  end

  def aplicar_filtro_data
    puts "Aplicando filtro por data"
    tap_bounds(939, 96, 1035, 192)
    sleep 1
    tap_bounds(912, 252, 1056, 396)
    sleep 1
    tap_bounds(120, 666, 528, 834)
    type_raw('01/01/2023')
    sleep 1
    tap_bounds(552, 666, 960, 834)
    type_raw('01/01/2024')
    sleep 1
    click_content_desc('OK')
    sleep 2
    tap_bounds(939, 96, 1035, 192)
    sleep 2
  end

  def aplicar_filtro_profissional
    puts "Aplicando filtro por profissional"
    click_content_desc('PROFISSIONAIS')
    sleep 1
    tap_bounds(50, 1789, 1030, 1945)
    type_search('Francine')
    sleep 2
    click_content_desc('Francine Gelo Borges Santiago')
    sleep 2
    click_content_desc('PROFISSIONAIS')
    sleep 2
  end

  def aplicar_filtro_status
    puts "Aplicando filtro por status"
    click_content_desc('STATUS')
    sleep 1
    click_content_desc('ATENDIDO')
    sleep 2

    click_content_desc('STATUS')
    sleep 1
    click_content_desc('DESMARCADO')
    sleep 2

    click_content_desc('STATUS')
    sleep 1
    click_content_desc('FALTA')
    sleep 2

    click_content_desc('STATUS')
    sleep 1
    click_content_desc('Limpar filtro')
    sleep 2
  end

  def aplicar_filtro_unidade
    puts "Aplicando filtro por unidades"
    click_content_desc('UNIDADES')
    sleep 1
    click_content_desc('CLINICA CASU')
    sleep 2

    click_content_desc('UNIDADES')
    sleep 1
    click_content_desc('CLINICA UNIMED PLENO')
    sleep 2

    click_content_desc('UNIDADES')
    sleep 1
    click_content_desc('PROPRIO DOMICILIO')
    sleep 2

    click_content_desc('UNIDADES')
    sleep 1
    click_content_desc('Limpar filtro')
    sleep 2
  end

  def desmarcar_agendamento
    puts "Desmarcando agendamento"
    click_content_desc('DESMARCAR')
    sleep 1
    tap_bounds(165, 905, 915, 1241)
    type_raw('Teste')
    sleep 1
    click_content_desc('Desmarcar')
    sleep 1
    click_content_desc('OK')
    sleep 2 # Sleep curto adicionado aqui
  end

  def click_content_desc(desc)
    puts "Clicando no elemento com content-desc: #{desc}"
    find_element(accessibility_id: desc).click
  end

  def tap_bounds(x1, y1, x2, y2)
    center_x = (x1 + x2) / 2
    center_y = (y1 + y2) / 2
    puts "Tocando nas coordenadas centralizadas: (#{center_x}, #{center_y})"
    tocar_por_coordenada(center_x, center_y)
  end

  def type_search(text)
    puts "Digitando no campo de busca: #{text}"
    find_element(class: 'android.widget.EditText').send_keys(text)
  end

  def type_raw(text)
    puts "Enviando texto cru: #{text}"
    $driver.action.send_keys(text).perform
  end
end
