class HomeScreen < Utils
  def initialize
    @substituicao_prestadores = "Consulta as substituições e exclusões de prestadores da rede credenciada Unimed.\nSubstituição de Prestadores"
  end

  def acessar_substituicao_prestadores
    puts "🧭 Clicando em 'Substituição de Prestadores' no carrossel"
    wait_for_element(@substituicao_prestadores, 10, :accessibility_id)
    find_element(accessibility_id: @substituicao_prestadores).click
  end
end
