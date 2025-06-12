require_relative '../support/utils'

class CardExchangeScreen < Utils
  def initialize
    @card_button_bounds = { x: 780, y: 156 } # aproximado para [740,119][815,194]
    @inactive_card_desc = 'REG-PP-PJ-AMBHOSP-OBST-RB-E-PARTICIPATIVO-APS-UNIMED UBERABA'
  end

  def open_card_selector
    puts "📇 Abrindo seletor de carteirinhas"
    tocar_por_coordenada(@card_button_bounds[:x], @card_button_bounds[:y])
    sleep 2
  end

  def select_inactive_card
    puts "🪪 Procurando carteirinha inativa"
    wait_for_element_partial_desc(@inactive_card_desc, 10)

    elementos = find_elements(:xpath, "//*[contains(@content-desc, '#{@inactive_card_desc}')]")
    raise "❌ Carteirinha inativa não encontrada" if elementos.empty?

    puts "✅ Carteirinha encontrada, clicando..."
    elementos.first.click
    sleep 2
  end
end
