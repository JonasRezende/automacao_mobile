Feature: Acesso a funcionalidades via carrossel da Home

    @carrossel @substituicao
    Scenario: Acessar Substituição de Prestadores pelo carrossel
        Given estou na tela inicial e vejo o carrossel
        When clico em Substituição de Prestadores
        Then sou direcionado para a tela de Substituição de Prestadores
