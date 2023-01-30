#language: pt

Funcionalidade: Notificações
 Como usuário participante desta campanha
 Quero visualizar as notificações disponibilizadas para o meu perfil
 Para acompanhar os comunicados da campanha


Critérios de Aceitação:
 Disponibilizar conforme segmentação definida
 Todas as notificações são listadas no ícone "Sino" como não lida até ser aberta e lida
 Ao final da listagem de notificações do ícone "Sino" tem uma opção para a tela de todas as notificações
 Após disparo da rotina, o usuário deve receber a notificação no banking da campanha e somar no "Sino" +1 não lida
 Sempre que o usuário visualizar uma notificação, excluí-la da contagem de itens não lidos.
 Notificações lidas são exibidas na listagem sem fonte negrito
 Notificação não lidas são exibidas na listagem com fonte negrito
 Quando a notificação está com checkbox "Mostrar após o login" ativo é exbida a cada novo login, até que seja marcada como lida
 Quando a notificação possui vídeo, o mesmo deve ser carregado dentro do modal da notificação
 O modal da notificação é composto pelo Título, Conteúdo descrito se houver, Vídeo se houver e botão de Ação "Ver Depois" e "Confirmar"
 No modal da notificação, ao clicar em "Ver depois", não marca como lida, permanecendo como não lida
 No modal da notificação, ao clicar em "Confirmar", marca por fim como lida
 Na tela de notificações, ao clicar em "Ver" abrir modal da notificação
 Continuar exibindo e abrindo notificações já lidas


Cenário: Sino ícone
    Dado que o usuário está logado na plataforma banking da campanha
    E estiver na Home, terá um ícone de "Sino"
    Quando chegam novas notificações entram na condição de "Não Lidas"
    Então o sistema exibe uma numeração informativa no ícone do "Sino" com o total de notificações não lidas

Cenário: Sino - Acessar
    Dado que o usuário está na Home da plataforma banking da campanha
    Quando acionar o "Sino"
    Então uma listagem com todas as Notificações será exibida

Cenário: Sino - Lista
    Dado que o usuário acionou o "Sino"
    Quando visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
    | Lidas         | Ficam sem negrito. O envelope fica aberto.         |
    | Não Lidas     | Ficam com negrito. O envelope fica fechado         |
    | Lsta de Notif | Ordenada pelo ID mais recente                      |
    | Botão         | Ver Todas: redireciona para a tela de Notificações |

Cenário: Sino - Botão Ver Todas
    Dado que o usuário acionou o "Sino"
    Quando acionar o botão "Ver Todas"
    Então o sistema redireciona o usuário para a tela de Notificação

Cenário: Listagem de todas as Notificações - Layout
    Dado que o usuário acionou o botão "Ver Todas" dentro do "Sino"
    Quando visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
    | Título | Notificações                   |
    | Gride  | Listagem das Notificações      |
    | Botão  | Ver                            |
    | Botão  | Voltar (para a home do baking) |

Cenário: Listagem de todas as Notificações - Ordenação
    Dado que o usuário acionou o botão "Ver Todas" dentro do "Sino"
    Quando visualizar a listagem de todas as notificações
    Então a ordenação será na ordem decrescente pelo ID de cadastro

Cenário: Abrir Notificação Lida
    Dado que o usuário acionou o "Sino"
    Quando clicar no envelope aberto de notificação, seja através da lista do "Sino" ou da lista da "Tela de Notificações"
    Então um modal será exibido com a notificação para o usuário com um botão "Confirmar"

Cenário: Abrir Notificação Não Lida
    Dado que o usuário acionou o "Sino"
    Quando clicar no envelope fechado de notificação, seja através da lista do "Sino" ou da lista da "Tela de Notificações"
    Então um modal será exibido com a notificação para o usuário com um botão "Ver depois"
    Quando o usuário acionar o botão "Ver depois"
    Então o modal da notificação fecha e permanece como uma notificação "Não Lida"
    Quando o usuário aguardar a visualização do vídeo
    Então o sistema vai exibir o botão "Confirmar"
    Quando o usuário por fim acionar o botão "Confirmar"
    Então o modal da notificação fechar e marca por fim como lida para o usuário

Cenário: Com vídeo e sem Conteúdo
    Dado que o usuário clicou em uma noticicação
    Quando o sistema exibir o modal da respectiva Notificação
    E essa notificação foi cadastrada apenas com Título e Link de Vídeo
    Então o modal é demonstrado contendo seu Título, o vídeo com player
    E após assitir 100% do vídeo o botão "Ver Depois" muda para "Confirmar"

Cenário: Sem vídeo e com conteúdo
    Dado que o usuário clicou em uma noticicação
    Quando o sistema exibir o modal da respectiva Notificação
    E essa notificação foi cadastrada apenas com Título e Conteúdo
    Então o modal é demonstrado contendo seu Título, e o Conteúdo descrito no cadastro
    E rapidamente o botão "Ver Depois" muda para "Confirmar"

Cenário: Com vídeo e com conteúdo
    Dado que o usuário clicou em uma noticicação
    Quando o sistema exibir o modal da respectiva Notificação
    E essa notificação foi cadastrada com Título, Link de Vídeo e Conteúdo
    Então o modal é demonstrado contendo seu Título, o Contepudo descrito e o vídeo com player
    E após assitir 100% do vídeo o botão "Ver Depois" muda para "Confirmar"

Cenário: Sem vídeo e sem conteúdo
    Dado que o usuário clicou em uma noticicação
    Quando o sistema exibir o modal da respectiva Notificação
    E essa notificação foi cadastrada apenas com Título
    Então o modal é demonstrado contendo apenas o Título
    E rapidamente o botão "Ver Depois" muda para "Confirmar"

Cenário: Mostrar após o login - Ver depois
    Dado que existe uma Notificação para ser exibida após o login, sendo sem segmentação
    Quando um usuário faz login na plataforma banking da campanha
    Então o modal da respectiva "Notificação" é exibido instantaneamente contendo o Título, Vídeo com player e Conteúdo
    E o botão "Ver Depois" fica disponível durante a exibição do "Vídeo"
    Quando o usuário acionar o botão "Ver Depois"
    Então o modal da notificação fecha e permanece como uma notificação "Não Lida"
    Quando o usuário fizer novo login na plataforma
    Então novamente o modal desta Notificação será exibido após o login

Cenário: Mostrar após o login - Confirmar
    Dado que existe uma Notificação para ser exibida após o login, sendo sem segmentação
    Quando um usuário faz login na plataforma banking da campanha
    Então o modal da respectiva "Notificação" é exibido instantaneamente contendo o Título, Vídeo com player e Conteúdo
    E o botão "Ver Depois" fica disponível durante a exibição do "Vídeo"
    Quando o usuário assitir 100% do vídeo o botão "Ver Depois" muda para "Confirmar"
    E acionar o botão "Confirmar"
    Então o modal da notificação fechar e marca por fim como lida para o usuário 
