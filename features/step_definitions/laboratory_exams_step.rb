require_relative '../android/laboratory_exams_screen'

Given('that I am logged in') do
  steps %{
    Given que estou na tela de login
    When preencho CPF e senha corretamente
    And clico no botão de login
    Then seleciono uma carteirinha
    And chego na tela inicial com sucesso
  }
end

When('I access the Laboratory Exams section') do
  @lab_exams = LaboratoryExamsScreen.new
  @lab_exams.access_laboratory_exams
end

When('I open the lab exam details') do
  @lab_exams.abrir_mais_informacoes
end

When('I open the lab PDF exam') do
  @lab_exams.open_pdf_exam
end

When('I download the lab PDF exam') do
  @lab_exams.download_pdf_exam
end

When('I go back from lab screen') do
  @lab_exams.go_back
end
