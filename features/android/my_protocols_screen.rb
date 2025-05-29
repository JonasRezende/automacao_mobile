require_relative '../support/utils'

class MyProtocolsScreen < Utils
  def initialize
    @botao_meus_protocolos_desc = "Meus\nProtocolos"
    @botao_mais_opcoes_bounds = { x: 540, y: 1179 }
    @arquivo_desc = "Jonas Willian Silva Rezende\nJPG\nimage_0.jpg\n15/05/2025 11:18"
    @botao_fechar_imagem_bounds = { x: 540, y: 1000 }
    @botao_download_bounds = { x: 1023, y: 156 }
    @botao_status_guia_bounds = { x: 807, y: 2020 }

    @botao_historico_desc = "Histórico"
    @botao_chat_desc = "Abrir chat"
    @scrim_desc = "Scrim"
    @botao_voltar_desc = "Voltar"
    @botao_ok_desc = "OK"
  end

  def acessar_meus_protocolos
    wait_for_element(@botao_meus_protocolos_desc, 10, :accessibility_id)
    find_element(accessibility_id: @botao_meus_protocolos_desc).click
    sleep 2
  end

  def abrir_historico
    find_element(accessibility_id: @botao_historico_desc).click
    sleep 2
  end

  def fechar_historico
    if element_is_present?(@scrim_desc)
      find_element(accessibility_id: @scrim_desc).click
    else
      tocar_por_coordenada(540, 1000)
    end
    sleep 2
  end

  def clicar_mais_opcoes
    tocar_por_coordenada(@botao_mais_opcoes_bounds[:x], @botao_mais_opcoes_bounds[:y])
    sleep 2
  end

  def abrir_arquivo
    wait_for_element(@arquivo_desc, 10, :accessibility_id)
    find_element(accessibility_id: @arquivo_desc).click
    sleep 2
  end

  def fechar_imagem
    tocar_por_coordenada(@botao_fechar_imagem_bounds[:x], @botao_fechar_imagem_bounds[:y])
    sleep 2
  end

  def abrir_chat
    find_element(accessibility_id: @botao_chat_desc).click
    sleep 3
  end

  def clicar_download
    tocar_por_coordenada(@botao_download_bounds[:x], @botao_download_bounds[:y])
    sleep 2
  end

  def abrir_arquivo_download
    find_element(accessibility_id: @arquivo_desc).click
    sleep 2
  end

  def fechar_arquivo_download
    tocar_por_coordenada(@botao_fechar_imagem_bounds[:x], @botao_fechar_imagem_bounds[:y])
    sleep 2
  end

  def clicar_status_guia
    tocar_por_coordenada(@botao_status_guia_bounds[:x], @botao_status_guia_bounds[:y])
    sleep 2
  end

  def clicar_botao_ok
    find_element(accessibility_id: @botao_ok_desc).click
    sleep 2
  end

  def clicar_voltar
    find_element(accessibility_id: @botao_voltar_desc).click
    sleep 2
  end
end
