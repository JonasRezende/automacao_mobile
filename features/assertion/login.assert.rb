class LoginAssert < Utils
  def initialize
    @home_element = 'home_welcome'
  end

  def check_home
    wait_for_element(@home_element, 10)
    expect(element_is_present?(@home_element)).to be_truthy
  end
end
