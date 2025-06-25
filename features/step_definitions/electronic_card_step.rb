require_relative '../android/electronic_card_screen'

When('acesso e interajo com o cartão eletrônico') do
  screen = ElectronicCardScreen.new
  screen.acessar_cartao_eletronico
  screen.interagir_com_cartao
  screen.acessar_qrcode_token
  screen.compartilhar_carteirinha
  screen.baixar_carteirinha
  screen.voltar

end
