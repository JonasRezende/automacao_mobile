require_relative '../support/utils'

class ImageExamsScreen < Utils
  def initialize
    @button_image_exams_desc = "Exames\nde Imagem"
    @button_more_info_open_bounds = { x: 609, y: 780 }    # [260,753][959,808]
    @button_more_info_close_bounds = { x: 609, y: 1128 }  # [260,1100][959,1156]
    @button_pdf_bounds = { x: 851, y: 657 }               # [803,609][899,705]
    @pdf_file_desc = "PDF_01"
    @button_download_bounds = { x: 1008, y: 156 }         # [936,84][1080,228]
    @button_save_desc = "Salvar"
    @button_more_options_desc = "Mais opções"
    @button_download_option_bounds = { x: 752, y: 468 }   # [484,432][1020,505]
    @button_back_desc = "Voltar"
    @button_video_bounds = { x: 962, y: 657 }             # [914,609][1010,705]
    @video_file_desc = "VIDEO_01"
  end

  def access_image_exams
    scroll_para_baixo
    wait_for_element(@button_image_exams_desc, 10, :accessibility_id)
    find_element(accessibility_id: @button_image_exams_desc).click
    sleep 4
  end

  def open_more_info
    tocar_por_coordenada(@button_more_info_open_bounds[:x], @button_more_info_open_bounds[:y])
    sleep 2
  end

  def close_more_info
    tocar_por_coordenada(@button_more_info_close_bounds[:x], @button_more_info_close_bounds[:y])
    sleep 2
  end

  def open_pdf
    tocar_por_coordenada(@button_pdf_bounds[:x], @button_pdf_bounds[:y])
    wait_for_element(@pdf_file_desc, 10, :accessibility_id)
    find_element(accessibility_id: @pdf_file_desc).click
    sleep 3
  end

  def download_pdf
    tocar_por_coordenada(@button_download_bounds[:x], @button_download_bounds[:y])
    sleep 1
    find_element(accessibility_id: @button_save_desc).click
    sleep 1
    find_element(accessibility_id: @button_more_options_desc).click
    sleep 1
    tocar_por_coordenada(@button_download_option_bounds[:x], @button_download_option_bounds[:y])
    sleep 2
  end

  def back
    find_element(accessibility_id: @button_back_desc).click
    sleep 2
  end

  def open_video
    tocar_por_coordenada(@button_video_bounds[:x], @button_video_bounds[:y])
    wait_for_element(@video_file_desc, 10, :accessibility_id)
    find_element(accessibility_id: @video_file_desc).click
    sleep 40
  end
end
