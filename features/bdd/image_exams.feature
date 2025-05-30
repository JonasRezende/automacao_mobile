Feature: Image Exams Consultation
        As a logged-in user
        I want to access image exams
        And interact with PDFs and video files

    @test
    Scenario: Access and interact with image exam files
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso

        When I access the Image Exams section
        And I open the exam details
        And I close the exam details
        And I open a PDF exam
        And I download the PDF exam
        And I go back to the previous screen
        And I go back to the previous screen
        And I open a video exam
        And I go back to the previous screen
        And I go back to the previous screen
