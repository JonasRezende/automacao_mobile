class LoginAssert < Utils
  def initialize
    @home_bounds_xpath = "//*[@bounds='[0,0][1080,2076]']"
  end

  def check_home
    puts "🔍 Verificando se chegou à tela inicial com XPath por bounds..."
    wait_for_element_by_xpath(@home_bounds_xpath, 10)
    expect(element_is_present_by_xpath?(@home_bounds_xpath)).to be_truthy
  end

  private

  def wait_for_element_by_xpath(xpath, timeout = 10)
    Selenium::WebDriver::Wait.new(timeout: timeout).until {
      !find_elements(:xpath, xpath).empty?
    }
  end

  def element_is_present_by_xpath?(xpath)
    !find_elements(:xpath, xpath).empty?
  end
end
