class LoginAssert < Utils
  def initialize
    # XPath baseado no bounds visível da tela inicial
    @home_bounds_xpath = "//*[@bounds='[0,722][1080,753]']"
  end

  def check_home
    puts "🔍 Verificando se chegou à tela inicial com XPath por bounds..."
    begin
      wait_for_element(@home_bounds_xpath, 10, :xpath)
      expect(find_element(:xpath, @home_bounds_xpath)).to be_truthy
    rescue => e
      raise "❌ Não foi possível confirmar a chegada na tela inicial: #{e.message}"
    end
  end
end
