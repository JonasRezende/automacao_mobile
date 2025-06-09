require_relative '../support/utils'

class NotificationsScreen < Utils
  def abrir_notificacoes
    puts "🔔 Acessando notificações"
    tocar_por_coordenada(883, 156)
    sleep 2
  end

  def ver_detalhes_e_voltar
    puts "📄 Clicando em 'Saiba mais'"
    tocar_por_coordenada(325, 1063)
    sleep 2

    puts "🔙 Voltando"
    find_element(accessibility_id: "Voltar").click
    sleep 1
  end

  def abrir_novidades
    puts "📰 Acessando novidades"
    tocar_por_coordenada(780, 380)
    sleep 2

    puts "📩 Clicando em uma notificação"
    tocar_por_coordenada(540, 1397)
    sleep 2
  end

  def abrir_configuracoes
  puts "⚙️ Acessando configurações"
  tocar_por_coordenada(1028, 156) # botão engrenagem
  sleep 2

  puts "📧 Alternando E-mail"
  tocar_por_coordenada(918, 655)
  sleep 1

  puts "📱 Alternando App"
  tocar_por_coordenada(918, 847)
  sleep 1

  puts "📨 Alternando SMS"
  tocar_por_coordenada(918, 1039)
  sleep 1

  puts "💬 Alternando WhatsApp"
  tocar_por_coordenada(918, 1231) # <- substitua pelo valor correto
  sleep 1
end

  def voltar_para_home
    puts "🔙 Voltando para a tela inicial (duas vezes)"

    begin
      find_element(accessibility_id: "Voltar").click
      sleep 1
    rescue
      puts "⚠️ Primeiro botão Voltar não encontrado"
    end

    begin
      find_element(accessibility_id: "Voltar").click
      sleep 1
    rescue
      puts "⚠️ Segundo botão Voltar não encontrado"
    end
  end
end
