Feature: Customer Service


    Scenario: Acessar e realizar atendimento ao cliente
        Given que estou logado como gestao de dependente
        When acesso a tela de Customer Service
        Then preencho e envio o formulario de atendimento
        Then preencho e envio o formulario de ouvidoria
