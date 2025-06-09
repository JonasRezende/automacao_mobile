Feature: Minhas Guias

    Scenario: Acessar, filtrar e interagir com Minhas Guias
        Given que estou na tela de login IRPF
        When acesso a tela Minhas Guias
        Then interajo com os cards e histórico
        And aplico filtros por status e tipo
        And aplico filtro por número da guia
        And aplico filtro por intervalo de datas
