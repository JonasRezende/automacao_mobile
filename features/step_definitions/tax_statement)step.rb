# Instancia a tela do IRPF
Before do
  @irpf_screen = TaxStatementScreen.new
end

Quando('acesso Demonstrativo de IRPF pela home') do
  @irpf_screen.acessar_demonstrativo_irpf
end

Quando('clico no PDF do Demonstrativo') do
  @irpf_screen.clicar_pdf
end

Quando('clico no botão de download do IRPF') do
  @irpf_screen.clicar_botao_download
end

Quando('clico no botão Salvar do IRPF') do
  @irpf_screen.clicar_botao_salvar
end

Quando('permito caso apareça a solicitação') do
  @irpf_screen.permitir_se_solicitar
end

Quando('clico no botão Mais Opções do IRPF') do
  @irpf_screen.clicar_mais_opcoes
end

Quando('clico no botão Baixar do IRPF') do
  @irpf_screen.clicar_botao_baixar
end

Quando('clico no botão Voltar do IRPF') do
  @irpf_screen.clicar_voltar
end

Quando('clico no botão Voltar novamente') do
  @irpf_screen.clicar_voltar
end

Quando('clico no botão Voltar mais uma vez') do
  @irpf_screen.clicar_voltar
end
