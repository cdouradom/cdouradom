#language: pt

Funcionalidade: Notificação - cadastro e edição



Cenário: Cadastro - Acessar
    Dado que o admin acessou o submenu "Notificações"
    E está na listagem de Notificações
    Quando acionar o botão "Cadastrar"
    Então o sistema redireciona para a tela de "Cadastro de Notificações"

Cenário: Cadastro - Layout do Cadastro
    Dado que o admin acessou a tela para "Cadastro de Notificações"
	Quando o admin visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
    | Breadcrumbs                   | com redirecionamento ao clique                            |
    | Input Título                  | Campo obrigatório alfanumérico                            |
    | Input Conteúdo                | Campo opcional alfanumérico                               |
    | Select Tipo do Arquivo        | Campo opcional - Lista com opções Vazia e Vídeo           |
    | Input Link do vídeo           | Campo opcional - Quando Tipo do Arquivo for igual a Vídeo |
    | Select Rede                   | Campo opcional - Lista de Redes Cadastradas.              |
    | Select Grupo                  | Campo opcional - Lista de Grupos Cadastrados              |
    | Select Revenda                | Campo opcional - Lista de Revendas Cadastradas            |
    | Input Data da Publicação      | Campo opcional - Calendário padrão                        |
    | Checkbox Mostrar após o Login | Campo opcional - Calendário padrão                        |
    | Botões                        | "Salvar", "Preview" e "Cancelar"                          |

Cenário: Cadastro - Cancelar Cadastro
    Dado que o admin está na tela para "Cadastro de Notificações"
    Quando acionar o botão "Cancelar"
    Então o sistema redireciona o admin para a listagem de "Notificações"
    E interrompe o cadastro da Notificações

Cenário: Cadastro - Com dados obrigatórios não preenchidos
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando não preencher os campos obrigatórios 
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Atenção" com a "<Mensagem do sistema>" ou exibe um alerta no campo
    E não faz o cadastro da Notificação
    E o admin permanece na mesma tela de cadastro
    Exemplos:
    | Título | Data da Publicação | Mensagem do sistema                            |
    |        |                    | O Campo TITULO não pode ser vazio!             |
    |        | 10/07/2022         | O Campo TITULO não pode ser vazio!             |
    | Teste  |                    | O Campo Data da Publicação não pode ser vazio! |

Cenário: Cadastro - Apenas com dados obrigatórios preenchidos e válidos
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando preencher somente os campos obrigatórios: "Título" e "Data da Publicação" com data maior que a atual
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação" e "Data do cadastro"
    E o status dessa notificação fica como "Agendado" até o disparo via rotina

Cenário: Cadastro - Limite de caracteres no Título
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando preencher no campo "Título" mais de 50 caracteres
    Então o sistema registra somente até "50 caracteres alfanuméricos"
    E bloqueia a digitação do admin de mais caracteres além dos 50 já digitados
    Quando o admin acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado"
    E o sistema grava o título da Notificação em banco dentro deste limite de caracteres

Cenário: Cadastro - Limite de caracteres no conteúdo
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando preencher no campo "Conteúdo" mais de 2000 caracteres
    Então o sistema registra somente até "2000 caracteres alfanuméricos"
    E bloqueia a digitação do admin de mais caracteres além dos 2000 já digitados
    Quando o admin acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado"
    E o sistema grava o conteúdo da Notificação em banco dentro deste limite de caracteres 

Cenário: Cadastro - Conteúdo não preenchido
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E preencheu o "Título" e a "Data da Publicação" com valores válidos
    Quando não preencher o campo "Conteúdo"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado"  

Cenário: Cadastro - Opções no select Tipo de Arquivo
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando clicar no input Tipo de Arquivo
    Então uma listagem com as opções "Vazio" e "Vídeo" serão listadas para seleção
    E por padrão o sistema traz a opção vazia selecionada
    #confirmar de tem opção vazia msm, e se necessário ajustar cenário

Cenário: Cadastro - Tipo de Arquivo "vazia"
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E clicou no input Tipo de Arquivo
    Quando selecionar a opção "Vazia"
    Então o campo "Link" não é disponibilizado para preenchimento do admin
    #confirmar de tem opção vazia msm, e se necessário ajustar cenário

Cenário: Cadastro - Tipo de Arquivo com Vídeo
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E clicou no input Tipo de Arquivo
    Quando selecionar a opção "Vídeo"
    Então o campo "Link" será disponibilizado para preenchimento do admin

Cenário: Cadastro - Link do Vídeo não preenchido
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E preencheu o "Título" e a "Data da Publicação" com valores válidos
    E selecionou a opção "Vídeo" no Tipo de Arquivo
    Mas não preencheu o campo "Link do vídeo"
    Quando acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado" 
    #ou exibe uma mensagem de que o link do vídeo deve ser preenchido. Confirmar e ajustar cenário

Cenário: Cadastro - Link do Vídeo com valor válido
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E preencheu o "Título" e a "Data da Publicação" com valores válidos
    E selecionou a opção "Vídeo" no Tipo de Arquivo
    Quando preencheu o campo "Link do vídeo" (https://youtu.be/VWAChF3RaY8)
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado" 

Cenário: Cadastro - Link do Vídeo com valor inválido 
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E preencheu o "Título" e a "Data da Publicação" com valores válidos
    E selecionou a opção "Vídeo" no Tipo de Arquivo
    Quando preencher o campo "Link do vídeo" com link "inválido"
    | XPTO      |
    | 123456789 |
    | /*-;^+    |
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado" 
        #OU (no teste analizar e conformar comportamento, seguir e ajustar cenario conforme análise e resultado que faz sentido)
    Então o sistema exibe um modal de "Atenção" com a "<Mensagem do sistema>" ou exibe um alerta no campo
    E não faz o cadastro da Notificação
    E o admin permanece na mesma tela de cadastro
    Exemplos:
    | Link do vídeo | Mensagem do sistema                               |
    | XPTO          | Informe uma Url válida / Url inválida, verifique! |
    | 123456789     | Informe uma Url válida / Url inválida, verifique! |
    | /*-;^+        | Informe uma Url válida / Url inválida, verifique! |


Cenário: Cadastro - Checkbox Após o Login Marcado
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E preencheu o "Título" e a "Data da Publicação" com valores válidos
    Quando marcar o checkbox "Mostrar após login"
    E acionar o botão "Salvar"
    Então o sistema verifica se já existe alguma nocitificação com o checkbox ativo
    Quando o sistema confirmar que não existe nenhuma outra notificação nesta campanha com esse checkbox ativo
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado" 
    E registra que esta campanha possui uma notificação com o checkbox "Mostrar após login" ativo

Cenário: Cadastro - Checkbox Após o Login Marcado novamente
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    E preencheu o "Título" e a "Data da Publicação" com valores válidos
    Quando marcar novamente o checkbox "Mostrar após login"
    E acionar o botão "Salvar"
    Então o sistema verifica se já existe alguma nocitificação com o checkbox ativo
    Quando o sistema confirmar que existe outra notificação nesta campanha com esse checkbox ativo
    Então exibe um modal de "Confirmação" para que o admin confirme se vai desabilitar o checkbox da Notificação Anterior ou não
    E terão duas opções "Cancelar" e "Confirmar"
    Quando o admin clicar em "Cancelar"
    Então o modal fecha e o admin pode desmarcar o checkbox desta notificação que está cadastrando para salvar sem a condição de "Mostrar após login"
    Mas se o o admin clicar em "Confirmar"
    Então o sistema remove o checkbox "Mostrar após login" da notificação anterior
    E exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!", cadastrando essa notificação
    E redireciona o admin para a listagem de Notificações
    E exibe essa Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado" 
    E registra que agora essa é a notificação com o checkbox "Mostrar após login" ativo
    
Cenário: Cadastro - Valores válidos nos campo obrigatórios e opcionais, sem segmentação
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando preencher todos os campos com valores válidos: "Título", "Conteúdo", "Tipo de arquivo = Vídeo", "Link do vídeo" e "Data de Publicação"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe a Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado"  

Cenário: Cadastro - Valores válidos nos campos obrigatórios e opcionais, e com segmentação
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando preencher todos os campos com valores válidos: "Título", "Conteúdo", "Tipo de arquivo = Vídeo", "Link do vídeo", "Data de Publicação", "Grupo", "Rede", "Revenda"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe a Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado"
    #`account_campaign_message_segregation`

Cenário: Cadastro - Com Data de Publicação igual ou menor que a data atual
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando clicar no campo "Data de Publicação"
    Então o sistema exibe uma calendário ou exibe o campo com máscara de data DD/MM/AAA #preferencialmente o calendário
    Quando o admin selecionar ou digitar uma data igual a atual ou passada (hoje, ontem...)
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Alerta" com a mensagem "A Data de Publicação precisa ser maior que a data atual" ou algo similar
    E não faz o cadastro da Notificação
    E o admin permanece na mesma tela de cadastro

Cenário: Cadastro - Com Data de Publicação maior que a data atual
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando clicar no campo "Data de Publicação"
    Então o sistema exibe uma calendário ou exibe o campo com máscara de data DD/MM/AAA #preferencialmente o calendário
    Quando o admin selecionar ou digitar uma data maior que a data atual (amanhã, depois...)
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação salva com sucesso!" ou algo similar
    E redireciona o admin para a listagem de Notificações
    E exibe a Notificação na listagem conforme "Título", "Data da Publicação", "Data do cadastro" e status "Agendado"

Cenário: Cadastro - Com Data de Publicação não preenchida
    Dado que o admin acessou a tela para "Cadastro de Notificações"
    Quando clicar no campo "Data de Publicação"
    Então o sistema exibe uma calendário ou exibe o campo com máscara de data DD/MM/AAA #preferencialmente o calendário
    Quando o admin não preencher o campo "Data de Publicação"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Alerta" com a mensagem "Informe uma Data de Publicação" ou algo similar
    E não faz o cadastro da Notificação
    E o admin permanece na mesma tela de cadastro    

Cenário: Cadastro - Com data inválida na Data de Publicação 
    Dado que o admin está na tela para "Cadastro de Notificações"
    Quando preencher datas inválidas no campo "<Data de Publicação>"
    E acionar o botão "Salvar"
    Então o sistema sinaliza a "<Mensagem do sistema>" ou algo similar
    E não faz o cadastro da Notificação
    E o admin permanece na mesma tela de cadastro  
    Exemplos:
    | Data de Publicaçã | Mensagem do sistema     |
    | 45/04/2022        | Informe uma data válida |
    | 30/02/2022        | Informe uma data válida |
    | 77/45/2022        | Informe uma data válida |

Cenário: Cadastro - Com valores inválidos na Data de Publicação 
    Dado que o admin está na tela para "Cadastro de Notificações"
    Quando preencher valores inválidos nos campos "<Data de Publicação>"
    Então o sistema "bloqueia a digitação" de texto ou caractere especial
    Exemplos:
    | Data de Publicação |
    | xpto               |
    | */-+               |

Cenário: Cadastro - Botão Preview com dados não preenchidos
    Dado que o admin está na tela para "Cadastro de Notificações"
    E ainda não preencheu os campos da Notificação
    Quando acionar o botão "Preview"
    Então um modal vazio será exibido ao admin
    E o admin poderá fechar o modal clicando no "x"
    #analisar e ajustar cenário se estiver diferente mas com sentido na utilização

Cenário: Cadastro - Botão Preview com dados preenchidos
    Dado que o admin está na tela para "Cadastro de Notificações"
    E preencheu todos os campos da Notificação com valores válidos: "Título", "Conteúdo", "Tipo de arquivo = Vídeo", "Link do vídeo", "Data de Publicação", "Grupo", "Rede", "Revenda"
    Quando acionar o botão "Preview"
    Então um modal será exibido com a prévia de como é demonstrado para os usuários no banking
    E o admin poderá fechar o modal clicando no "x"


#edição 

Cenário: Editar - Acessar
    Dado que o admin estava na tela de "Notificações"
    E acionou o botão "Ações" de uma Notificação na listagem
    Quando acionar a opção "Alterar" dentro de Ações
    Então o sistema redireciona o admin para a tela de "Edição/Visualização"
    E o ID desta Notificação será evidenciado no final da url
    E os campos abaixo desta Notificação serão exibidos preenchidos conforme já cadastrados
    |"Título" | "Conteúdo" | "Tipo de arquivo" | "Link do vídeo" | "Data de Publicação" | "Grupo" | "Rede" | "Revenda" | Checkbox "Mostrar após o login" |
    E terão os botões : "Salvar", "Cancelar", "Preview"

Cenário: Editar - Preview
    Dado que o admin estava na tela de "Notificações"
    E acionou o botão "Ações" de uma Notificação na listagem
    Quando acionar a opção "Visualizar" dentro de Ações
    Então um modal será exibido com a prévia de como é demonstrado para os usuários no banking
    E o admin poderá fechar o modal clicando no "x"

Cenário: Editar - Cancelar
    Dado que o admin estava na tela de "Notificações"
    E está na tela para "Edição da Notificação"
    Quando acionar o botão "Cancelar"
    Então o sistema redireciona o admin para a listagem de "Notificações"
    E não altera nenhuma informação da Notificação

Cenário: Editar - Deletar todos os campos e salvar de Notif Agendada
    Dado que o admin acionou a opção "Visualizar" 
    E está na tela para "Edição da Notificação"
    E essa notificação ainda está no status "Agendado"
    Quando apagar todos os dados
    E acionar o botão "Salvar"
    Então o sistema sinaliza com as mensagens de campos obrigatórios "O Campo TITULO não pode ser vazio!" e "O Campo Data da Publicação não pode ser vazio!"
    E não altera nenhuma informação da Notificação
    E o admin permanece na mesma tela da edição/visualização  

Cenário: Editar - Alterar Título de Notif Agendada
    Dado que o admin acionou a opção "Visualizar" 
    E está na tela para "Edição da Notificação"
    E essa notificação ainda está no status "Agendado"
    Quando alterar o "Título" da Notificação
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação editada com sucesso!" ou algo similar
    E redireciona o admin para a listagem
    E exibe nessa Notificação conforme novo "Título"

Cenário: Editar - Alterar Conteúdo de Notif Agendada
    Dado que o admin acionou a opção "Visualizar" 
    E está na tela para "Edição da Notificação"
    E essa notificação ainda está no status "Agendado"
    Quando alterar e/ou apagar o "Conteúdo" da Notificação
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação editada com sucesso!" ou algo similar
    E redireciona o admin para a listagem
    E atualiza o Conteúdo para o disparo da Notificação na `account_campaign_message_board.description`
    Mas o admin pode conferir novo Conteúd acessando novamente a opção "Visualizar"

Cenário: Editar - Alterar Data de Publicação de Notif Agendada
    Dado que o admin acionou a opção "Visualizar" 
    E está na tela para "Edição da Notificação"
    E essa notificação ainda está no status "Agendado"
    Quando alterar a "Data de Publicação" da Notificação
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação editada com sucesso!" ou algo similar
    E redireciona o admin para a listagem
    E exibe nessa Notificação conforme nova "Data de Publicação"

Cenário: Editar - Alterar a segmentação de Notif Agendada
    Dado que o admin acionou a opção "Visualizar" 
    E está na tela para "Edição da Notificação"
    E essa notificação ainda está no status "Agendado"
    Quando alterar a "Segmentação" da Notificação por "Grupo"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Notificação editada com sucesso!" ou algo similar
    E redireciona o admin para a listagem
    E exibe nessa Notificação conforme nova "Data de Publicação"
    E atualiza a segmentação dessa Notificação
    #grava segmentação na `account_campaign_message_segregation`

Cenário: Editar - Notif Enviada
    Dado que o admin acionou a opção "Visualizar" 
    E está na tela para "Edição da Notificação"
    Quando essa notificação já está no status "Enviada"
    Então não é mais demonstrado o botão "Salvar"

Cenário: Rodar cron para disparo de Notificação com Data de Publicação Igual a hoje
    Dado que existem notificações com Data de Publicação para hoje
    Quando rodar a rotina "publishMessageBoard" no link do serviço de crons para QA (processo interno)
    Então todas as notificações com 'account_campaign_message_board.publication_date' igual a data atual serão enviadas
    E registrado a data e hora do disparo na 'account_campaign_message_board.published_date'
    E o status dessa Notificação é atualizado para "Enviado"
    E todas os participantes que a rotina fez disparo da notificação são registrados na 'account_campaign_message_board_notification'

Cenário: Rodar cron para disparo de Notificação com Data de Publicação menor que hoje
    Dado que existem notificações com Data de Publicação para ontem e/ou antes
    Quando rodar a rotina "publishMessageBoard" no link do serviço de crons para QA (processo interno)
    Então a rotina não puxa essas notificações com 'account_campaign_message_board.publication_date' para ontem e/ou antes
    E não faz nenhum disparo ou registros

Cenário: Rodar cron para disparo de Notificação com Data de Publicação maior que hoje
    Dado que existem notificações com Data de Publicação para amanhã e/ou depois
    Quando rodar a rotina "publishMessageBoard" no link do serviço de crons para QA (processo interno)
    Então a rotina não puxa essas notificações com 'account_campaign_message_board.publication_date' para amanhã e/ou depois
    E não faz nenhum disparo ou registros


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Log de Cadastro e Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos:
            | ID (registro do banco)                   |
            | Ação executada (cadastro, alteração etc.)|
            | Campo (Nome, Status etc.);               |
            | logs de exclusão de Administrador        |
            | Data e hora do cadastro e/ou alterações  |
            | admin que cadastrou e/ou alterou/excluiu |
            | IP do computador do admin que fez a ação |

            
#40CN