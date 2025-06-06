# Step definitions para cadastro de guia com imagem da câmera
require_relative '../android/register_guide_screen'

Before do
  @register_guide = RegisterGuideScreen.new
end

Quando("acesso o menu de cadastro de guia") do
  @register_guide.scroll_home_e_acessa_cadastro
end

Quando("preencho os dados da guia") do
  @register_guide.preencher_formulario
end

Quando("anexo uma imagem pela câmera") do
  @register_guide.anexar_imagem_camera
end

Então("envio a guia") do
  @register_guide.enviar_guia
end
