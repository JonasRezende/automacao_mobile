Quando('acesso o Guia Médico pela home') do
  GuiaMedicoScreen.new.acessar_guia_medico
end

Quando('clico no botão Pesquisar') do
  GuiaMedicoScreen.new.clicar_pesquisar
end

Quando('digito o nome do médico') do
  tela = GuiaMedicoScreen.new
  tela.tocar_caixa_texto
  tela.digitar_nome("Djalma")
end

Quando('clico no botão de buscar médico') do
  GuiaMedicoScreen.new.clicar_botao_pesquisar
end

Quando('seleciono o médico encontrado') do
  GuiaMedicoScreen.new.selecionar_medico
end

Quando('clico no endereço do médico') do
  GuiaMedicoScreen.new.clicar_endereco
end

Quando('confirmo o modal do mapa') do
  GuiaMedicoScreen.new.confirmar_modal
end

Quando('fecho o navegador externo') do
  GuiaMedicoScreen.new.fechar_navegador
end

Quando('faço rolagem até o fim da tela') do
  GuiaMedicoScreen.new.rolar_ate_o_fim
end

Quando('clico no telefone do médico') do
  GuiaMedicoScreen.new.clicar_telefone
end

Quando('confirmo o modal de ligação') do
  GuiaMedicoScreen.new.confirmar_modal
end
