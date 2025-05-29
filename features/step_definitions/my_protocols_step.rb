require_relative '../android/my_protocols_screen'

Before do
  @protocolos = MyProtocolsScreen.new
end

Quando('acesso Meus Protocolos pela home') do
  @protocolos.acessar_meus_protocolos
end

Quando('abro o histórico do protocolo') do
  @protocolos.abrir_historico
end

Quando('fecho o histórico do protocolo') do
  @protocolos.fechar_historico
end

Quando('clico em mais opções do protocolo') do
  @protocolos.clicar_mais_opcoes
end

Quando('abro um arquivo do protocolo') do
  @protocolos.abrir_arquivo
end

Quando('fecho a visualização do arquivo') do
  @protocolos.fechar_imagem
end

Quando('abro o chat do protocolo') do
  @protocolos.abrir_chat
end

Quando('clico no botão de download do protocolo') do
  @protocolos.clicar_download
end

Quando('abro o arquivo baixado do protocolo') do
  @protocolos.abrir_arquivo_download
end

Quando('fecho o arquivo baixado do protocolo') do
  @protocolos.fechar_arquivo_download
end

Quando('clico no botão de Status da Guia') do
  @protocolos.clicar_status_guia
end

Quando('clico no botão OK do Status da Guia') do
  @protocolos.clicar_botao_ok
end

Quando('clico no botão Voltar dos protocolos') do
  @protocolos.clicar_voltar
end
