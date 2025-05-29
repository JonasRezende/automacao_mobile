Before do
  @guia_medico_screen = GuiaMedicoScreen.new
end

Quando('acesso o Guia Médico pela home') do
  @guia_medico_screen.acessar_guia_medico
end

Quando('clico no botão Pesquisar') do
  @guia_medico_screen.clicar_pesquisar
end

Quando('digito o nome do médico') do
  @guia_medico_screen.tocar_caixa_texto
  @guia_medico_screen.digitar_nome("Djalma")
end

Quando('clico no botão de buscar médico') do
  @guia_medico_screen.clicar_botao_pesquisar
end

Quando('seleciono o médico encontrado') do
  @guia_medico_screen.selecionar_medico
end

Quando('clico no endereço do médico') do
  @guia_medico_screen.clicar_endereco
end

Quando('confirmo o modal do mapa') do
  @guia_medico_screen.confirmar_modal
end

Quando('fecho o navegador externo') do
  @guia_medico_screen.fechar_guia
end

Quando('faço rolagem até o botão de telefone') do
  @guia_medico_screen.rolar_para_botao_telefone
end

Quando('clico no telefone do médico') do
  @guia_medico_screen.clicar_telefone
end

Quando('confirmo o modal de ligação') do
  @guia_medico_screen.confirmar_modal
end
