require_relative '../support/utils'

class InstitutionalScreen < Utils
  def initialize
    @ver_todos_bounds = { x: 873, y: 1853 }
    @institucional_bounds = { x: 400, y: 978 } # dentro de [299,877][500,1078]
    @conheca_nossa_equipe_bounds = { x: 540, y: 1662 } # dentro de [50,1512][1030,1812]
  end

  def acessar_menu_ver_todos
    puts '➡️ Scroll na tela inicial'
    scroll_para_baixo

    puts '📂 Acessando "Ver Todos"'
    tocar_por_coordenada(@ver_todos_bounds[:x], @ver_todos_bounds[:y])
    sleep 2
  end

  def entrar_em_institucional
    puts '➡️ Scroll na tela de funcionalidades'
    scroll_para_baixo

    puts '🏛️ Acessando "Institucional"'
    tocar_por_coordenada(@institucional_bounds[:x], @institucional_bounds[:y])
    sleep 2
  end

  def acessar_unidades
    puts '📍 Acessando "Unidades"'
    tocar_por_coordenada(540, 370) # Coordenada central dos bounds [60,298][1020,441]
    sleep 3
  end

  def acessar_telefone
    puts '📞 Clicando no telefone'
    tocar_por_coordenada(270, 750) # Coordenada mais abaixo do campo
    sleep 1
  end

  def confirmar_chamada
    puts '☑️ Confirmando chamada'
    begin
      wait_for_element('Sim', 5, :accessibility_id)
      find_element(accessibility_id: 'Sim').click
    rescue
      puts '⚠️ Botão "Sim" não encontrado por content-desc. Tentando por coordenada.'
      tocar_por_coordenada(900, 1750)
    end
    sleep 2
    voltar_para_app
  end

   def acessar_email
    puts '📧 Clicando no email'
    tocar_por_coordenada(381, 828) # Coordenada ajustada mais abaixo do bounds [85,774][678,882]
    sleep 1
  end

  def confirmar_email
    begin
      wait_for_element('Sim', 5, :accessibility_id)
      find_element(accessibility_id: 'Sim').click
    rescue
      puts '⚠️ Botão "Sim" (email) não encontrado. Tentando por coordenada.'
      tocar_por_coordenada(900, 1750)
    end
    sleep 5

    puts '🔙 Voltando da tela de email'
    begin
      find_element(accessibility_id: 'Navegar para cima').click
    rescue
      puts '⚠️ Botão "Navegar para cima" não encontrado. Tentando por coordenada.'
      tocar_por_coordenada(100, 150) # coordenada aproximada do topo esquerdo
    end

    puts '🔁 Voltando ao aplicativo'
    $driver.activate_app('com.unimed.app.oneplace.dev')
    sleep 2
  end

  def voltar_para_pagina_institucional
    puts '🔙 Retornando para menu institucional'
    find_element(accessibility_id: 'Voltar').click
    sleep 1
  end

    def acessar_produtos
    puts '📦 Acessando "Produtos"'
    begin
      find_element(accessibility_id: 'Produtos').click
    rescue
      puts '⚠️ Elemento "Produtos" não encontrado por content-desc. Tentando por coordenada.'
      tocar_por_coordenada(540, 930)
    end
    sleep 2
  end

 def acessar_produto_especifico
    puts '📄 Acessando produto específico'
    tocar_por_coordenada(540, 365) # Coordenada central dos bounds [50,294][1030,437]
    sleep 2

    puts '👆 Tocando em qualquer parte da tela após abrir o produto'
    tocar_por_coordenada(540, 800)
    sleep 1

    puts '🔙 Retornando da tela do produto'
    tocar_por_coordenada(100, 150)
    sleep 1
  end

  def voltar_para_pagina_produtos
    puts '🔙 Retornando para a tela de produtos'
    # Removido segundo clique para evitar voltar à home
    sleep 1
  end

  def acessar_institucional
    puts '🏛️ Acessando "Institucional" novamente'
    tocar_por_coordenada(540, 748) # centro dos bounds [60,674][1020,823]
    sleep 2
  end

  def acessar_sobre
    puts '📘 Acessando "Sobre"'
    tocar_por_coordenada(540, 940)
    sleep 1
  end

  def acessar_nossa_equipe
    puts '👥 Conhecendo a equipe'
    tocar_por_coordenada(@conheca_nossa_equipe_bounds[:x], @conheca_nossa_equipe_bounds[:y])
    sleep 2
  end

  def scroll_nossa_equipe
    scroll_para_baixo
    sleep 2
  end

  def voltar_para_pagina_sobre
    find_element(accessibility_id: 'Voltar').click
  end

  def voltar_para_pagina_anterior
    find_element(accessibility_id: 'Voltar').click
  end

  def voltar_para_home
    find_element(accessibility_id: 'Voltar').click
  end
end