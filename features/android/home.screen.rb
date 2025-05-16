require_relative '../support/utils'  # ← importante manter

class HomeScreen < Utils  # ✅ herança obrigatória para usar métodos utilitários
  def initialize
    @imagem_clinica_bounds = { x: 277, y: 956 } # centro dos bounds [50,776][504,1136]
    @tempo_espera_bounds = { x: 756, y: 956 }   # centro dos bounds [529,776][983,1136]
  end

  def acessar_clinica_imagem
    puts "📸 Tocando no botão da clínica de imagem na tela home"
    tocar_por_coordenada(@imagem_clinica_bounds[:x], @imagem_clinica_bounds[:y])
    sleep 3 # espera redirecionamento para o WhatsApp
  end

  def tocar_tempo_espera
    puts "⏳ Tocando no botão 'Tempo de Espera'"
    tocar_por_coordenada(@tempo_espera_bounds[:x], @tempo_espera_bounds[:y])
    sleep 2
  end

  def tocar_hospital_unimed
    puts "🏥 Selecionando o hospital 'Unimed Uberaba'"
    find_element(accessibility_id: "Hospital Unimed Uberaba").click
    sleep 1
  end

  def fechar_menu_scrim
    puts "🔙 Fechando o menu (Scrim)"
    find_element(accessibility_id: "Scrim").click
    sleep 1
  end

  def tocar_recursos_proprios
    puts "🏥 Tocando em 'Recursos Próprios'"
    find_element(accessibility_id: "Recursos Próprios").click
    sleep 2
  end
end
