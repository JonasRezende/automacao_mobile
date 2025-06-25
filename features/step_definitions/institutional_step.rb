When('acesso e navego pelo menu institucional com sucesso') do
  screen = InstitutionalScreen.new
  screen.acessar_menu_ver_todos
  screen.entrar_em_institucional
  screen.acessar_unidades
  screen.acessar_telefone
  screen.confirmar_chamada   # ✅ Já volta para o app internamente
  screen.acessar_email
  screen.confirmar_email     # ✅ Já volta para o app internamente
  screen.voltar_para_pagina_institucional
  screen.acessar_produtos
  screen.acessar_produto_especifico
  screen.voltar_para_pagina_produtos
  screen.acessar_institucional
  screen.voltar_para_pagina_institucional
  screen.acessar_sobre
  screen.acessar_nossa_equipe
  screen.scroll_nossa_equipe
  screen.voltar_para_pagina_sobre
  screen.voltar_para_pagina_anterior
  screen.voltar_para_home
end