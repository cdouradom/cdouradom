#language: pt

Funcionalidade: Notificação - Listagem e exclusão de Notificação
 Como usuário admin desta campanha
 Quero acessar a tela do módulo de Notificaçãos
 Para visualizar os Notificação existentes


Cenário: Listagem - Acesso e Layout
    Dado que o admin está logado na Plataforma da campanha
    Quando o admin acionar o menu principal
    E acionar o menu "Gerencial"
    Então serão demonstrados os submenus disponíveis, entre eles: "Notificaçãos"
    Quando o admin acionar o submenu "Notificaçãos"
    Então o sistema redireciona o admin para a listagem de Notificação
    Quando o admin visualizar todos os elementos da tela "Notificaçãos"
    Então os elementos da tela estão alinhados corretamente
    | Breadcrumbs       | com redirecionamento ao clique                                                                  |
    | Qnt registros     | Foram encontrados 'x' registros                                                                 |
    | Botão "Cadastrar" | Com url da tela de cadastro                                                                     |
    | Gride - Títulos   | Título, Data do cadastro, Data da Publicação, Status, Ações                                     |
    | Gride - Listagem  | Informações respectivas ao cabeçalho, Ações: Visualizar, Exluir, Alterar e Relatório de entrega |

Cenário: Listagem - Abrir Ações no status Agendado
    Dado que o admin está na tela de "Notificaçãos"
    E existe um Notificação na listagem com status "Agendado"
    Quando acionar o botão "Ações"
    Então serão demonstradas as opções "Visualizar", "Exluir", "Alterar" e "Relatório de entrega"

Cenário: Listagem - Abrir Ações no status Enviado
    Dado que o admin está na tela de "Notificaçãos"
    E existe um Notificação na listagem com status "Enviado"
    Quando acionar o botão "Ações"
    Então serão demonstradas as opções "Visualizar" e "Relatório de entrega"

Cenário: Listagem - Acionar opção Alterar no status Agendado
    Dado que o admin está na tela de "Notificaçãos"
    E acionou o botão "Ações" de Notificação no status "Agendado"
    Quando acionar a opção "Alterar" dentro de Ações
    Então o sistema redireciona o admin para a tela de "Edição" da Notificação
    E o ID dessa Notificação é evidenciado no final da url da tela
    E os campos abaixo dessa Notificação serão exibidos preenchidos conforme já cadastrados
    | "Título" | "Conteúdo" | "Tipo de arquivo" | "Link do vídeo" | "Data de Publicação" | "Grupo" | "Rede" | "Revenda" | Checkbox "Mostrar após o login" |
    E terão os botões: "Salvar", "Cancelar", "Preview"

Cenário: Listagem - Acionar opção Excluir no status Agendado
    Dado que o admin está na tela de "Notificaçãos"
    E acionou o botão "Ações" de Notificação no status "Agendado"
    Quando acionar a opção "Excluir" dentro de Ações
    Então o sistema exibe o modal "Exclusão de Notificação" para confirmação com os botões "Cancelar" e "Excluir"
    | Deseja excluir a Notificação? |

Cenário: Listagem - Cancelar exclusão da Notificação
    Dado que o admin acionou a opção "Excluir" dentro de "Ações" de Notificação no status "Agendado"
    E o sistema exibiu o modal de "Exclusão de Notificação" para confirmação
    Quando o admin acionar o botão "Cancelar"
    Então o sistema fecha o modal
    E o Notificação não é excluída

Cenário: Listagem - Confirmar exclusão do Notificação
    Dado que o admin acionou a opção "Excluir" dentro de "Ações"
    E o sistema exibiu o modal de "Exclusão de Notificação" para confirmação
    Quando o admin acionar o botão "Confirmar"
    Então o sistema recarrega a tela, exclui a Notificação da campanha
    E não lista mais o Notificação excluída

Cenário: Listagem - Acionar opção Visualizar
    Dado que o admin está na tela de "Notificaçãos"
    E acionou o botão "Ações"
    Quando acionar a opção "Visualizar" dentro de "Ações"
    Então um modal será exibido com a prévia de como é demonstrada a notificação para os usuários no banking
    E o admin poderá fechar o modal clicando no "x"
