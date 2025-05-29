Before do
  @minhas_utilizacoes_screen = MinhasUtilizacoesScreen.new
end

Quando('acesso Minhas Utilizações pela home') do
  @minhas_utilizacoes_screen.acessar_minhas_utilizacoes
end

Quando('clico em um PDF de utilização') do
  @minhas_utilizacoes_screen.clicar_pdf_utilizacao
end

Quando('clico no botão de download do PDF') do
  @minhas_utilizacoes_screen.clicar_botao_download
end

Quando('clico no botão Salvar') do
  @minhas_utilizacoes_screen.clicar_botao_salvar
end

Quando('clico no botão Mais Opções') do
  @minhas_utilizacoes_screen.clicar_mais_opcoes
end

Quando('clico no botão Baixar') do
  @minhas_utilizacoes_screen.clicar_botao_baixar
end

Quando('clico no botão Voltar') do
  @minhas_utilizacoes_screen.clicar_voltar
end
