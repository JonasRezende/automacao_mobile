Feature: Register Guide

    Scenario: Complete the register guide flow
        Given que estou na tela de login
        When preencho CPF e senha corretamente
        And clico no botão de login
        Then seleciono uma carteirinha
        And chego na tela inicial com sucesso
        When acesso o menu de cadastro de guia
        And preencho os dados da guia
        And anexo uma imagem da galeria
        Then envio a guia
