require_relative '../support/utils'

class ElectronicCardScreen < Utils
  def acessar_cartao_eletronico
    puts '➡️ Scroll na home até "Ver Todos"'
    scroll_para_baixo
    tocar_por_coordenada(873, 1853) # Coordenada do botão "Ver Todos"
    sleep 2

    puts '🎫 Acessando Cartão Eletrônico'
    tocar_por_coordenada(150, 965) # bounds = [50,864][251,1065]
    sleep 2
  end

  def interagir_com_cartao
    puts '➕ Clicando em "Mais"'
    tocar_por_coordenada(700, 1870) 
    sleep 1

    puts '➖ Clicando em "Menos"'
    tocar_por_coordenada(700, 1870)
    sleep 1

    puts '🔒 Clicando no interruptor'
    tocar_por_coordenada(565, 2018) 
    sleep 3
  end

  def acessar_qrcode_token
    puts '🔹 Clicando em QRCode/Token'
    tocar_por_coordenada(789, 311) 
    sleep 2
    puts '⬅️ Voltando'
    tocar_por_coordenada(104, 156) # novo bounds informado
    sleep 1
end

  def compartilhar_carteirinha
    puts '➡️ Voltando e acessando "Compartilhar carteirinha"'
    tocar_por_coordenada(873, 1853) # Ver Todos
    sleep 2
    tocar_por_coordenada(400, 965) # bounds = [299,864][500,1065]
    sleep 2

    puts '👆 Tocando em qualquer lugar da tela para prosseguir'
    tocar_por_coordenada(540, 1038) # centro da tela
    sleep 1
end

  def baixar_carteirinha
    puts '➡️ Voltando e acessando "Download da carteirinha"'
    tocar_por_coordenada(873, 1853) # Ver Todos
    sleep 2
    tocar_por_coordenada(648, 965) # bounds = [548,864][749,1065]
    sleep 3

    puts '⬇️ Clicando no botão de Download'
    tocar_por_coordenada(1008, 156) # bounds = [936,84][1080,228]
    sleep 2

    puts '💾 Clicando em Salvar'
    tocar_por_content_desc('Salvar')
    sleep 2

    puts '⋮ Clicando em "Mais opções"'
    tocar_por_content_desc('Mais opções')
    sleep 1

    puts '⬇️ Clicando em "Baixar"'
    tocar_por_coordenada(752, 469) # bounds = [436,397][1068,541]
    sleep 2
  end

    def voltar
  puts '🔙 Clicando no botão "Voltar"'
  begin
    tocar_por_content_desc('Voltar')
    tocar_por_content_desc('Voltar')

  rescue
    puts '⚠️ Botão "Voltar" não encontrado — tentando por coordenada'
    tocar_por_coordenada(100, 150) # coordenada aproximada do topo esquerdo
  end
  sleep 1
end
end
