#language: pt

Funcionalidade: Notícia - Cadastro e Edição
 Como usuário admin desta campanha
 Quero cadastrar Notícias, segmentadas e não segmantadas
 Para disponibilizar aos participantes da campanha

-----

Critérios de Aceitação:
 Apenas o título e a imagem são de preenchimento obrigatório
 A imagem cadastrada é exibida na Thumb da notícia
 Quando não for cadastrada uma imagem na Notícia, uma imagem ou fundo padrão deve ser exibido no fundo da thumb #verificar, pois no requisito imagem é obrigatório
 A data de cadastro é exibida na thumb na Notícia
 A descrição tem limite de caractere
 O conteúdo pode ser formatado
 Quando cadastrado um vídeo na Notícia, deve ser exibido ao usuário nos detalhes da Notícia
 Podem ser segmantadas por Grupo, Rede e Cargo
 Apenas os Grupos e Redes da campanha devem ser exibidos nos selects destes filtros
 Quando o Redirecionamento está com opção Não, o sistema não habilita o campo para cadastro do link
 Quando o Redirecionamento está com opção Sim, o sistema habilita o campo para cadastro do link
 Quando a Notícia já possui link para redirecionamento, o link é exibido na edição
 Na edição todos os campos preenchidos no cadastro devem vir preenchidos, exceto a imagem que por padrão não vem
 Campos multiselect: Grupos, Rede, Cargo
 Quando não informado algum tipo segmentação, a notícia é disponibilizada para todos os usuários

 ---

@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastrar_layout.png)
    Cenário: Cadastro de Notícia - Acessar, Layout, Funcionalidade do autocomplete nos selects e Cancelar
        Dado que o admin acessou o submenu "Notícias"
        E está na listagem de Notícias
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona para a tela de "Cadastro de Notícias" de url ".../Plataform/News/addd"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs                       | com redirecionamento ao clique                                                   |
            | Seção topo: Título                | Campo obrigatório alfanumérico com limite de 100 caracteres                      |
            | Seção topo: Descrição             | Campo opcional com limite de 180 caracteres                                      |
            | Seção topo: Imagem                | Campo opcional - upload de arquivo nos formatos JPG, JPEG e PNG                  |
            | Seção topo: Vídeo                 | Campo opcional - Url do youtube                                                  |
            | Seção topo: Data de Divulgação    | Campo opcional - disponibiliza nesta data (igual ou futura à data atual)         |
            | Seção topo: Peso                  | Lista númerica de 1 a 5 (segue ordem de peso e depois maior ID)                  |
            | Seção Conteúdo                    | Campo opcional para descrição completa do Conteúdo com limite de 2500 caracteres |
            | Seção segmentação: Select Cargo   | Campo opcional - Lista de Carogs da campanha                                     |
            | Seção segmentação: Select Grupo   | Campo opcional - Lista de Grupos Cadastrados                                     |
            | Seção segmentação: Select Rede    | Campo opcional - Lista de Redes Cadastradas                                      |
            | Seção Redirecionamento: Habilitar | Sim e Não - por padrão vem Não                                                   |
            | Seção Redirecionamento: Link      | Preecnhimento de link quando "Habilitar = Sim"                                   |
            | Botões de ação                    | "Cancelar" e "Salvar"                                                            |
        Quando clicar nos campos de select: "Grupo", "Rede" e "Cargo"
        Então o sistema exibe em lista suspensa todos os registros para cada campo
        Quando o admin digitar um termo existente
        Então a listagem exibe somente às opções que possuem o termo digitado em cada campo
        Quando o admin digitar um termo que não existe
        Então a listagem não exibe nada
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Notícias"
        E interrompe o cadastro do Notícia


@manual
@Tarefa_#:#59197
@Sugestão_#60845
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastro_campos_obrigatório.png)
    Cenário: Cadastro de Notícia - Com dados obrigatórios não preenchidos
        Dado que o admin acessou a tela para "Cadastro de Notícias"
        Quando não preencher o "Título" e/ou a "Imagem"
        E acionar o botão "Salvar"
        Então o sistema exibe um alerta no(s) campo(s) de "Preencha este campo"
        E não faz o cadastro do Notícia
        E o admin permanece na mesma tela de cadastro


@manual
@Tarefa_#:#59197
@Ajuste_#60847
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastro_data_invalida.png)
Cenário: Cadastro de Notícia - Com Data de Divulgação inválida
    Dado que o admin está na tela para "Cadastro de Notícias"
    Quando preencher datas inválidas no campo "<Data de Divulgaçã>o"
    E acionar o botão "Salvar"
    Então o sistema sinaliza a "<Mensagem do sistema>" ou algo similar
    Exemplos:
            | Data de Divulgação | Mensagem do sistema     |
            | 30/02/2022         | Informe uma data válida |
            | 45/14/2022         | Informe uma data válida |
            | 31/04/2022         | Informe uma data válida |
            | */-+               | bloqueia a digitação    |
            | xpto               | bloqueia a digitação    |


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastrar_conteúdo.webm)
    Cenário: Cadastro de Notícia - Conteúdo com formatação de texto
        Dado que o admin está na tela para "Cadastro de Notícias"
        Quando digitar um texto no campo "Conteúdo"
        E aplicar a formatação com as opções disponíveis
        Então o sistema exibe toda a formatação do texto neste campo conforme definido pelo admin, seja fonte, cor, alinhamentos, marcadores, citação, tabela, etc.
        Quando acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia salva com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe esse Notícia na listagem conforme "título" recém cadastrado
        E disponibiliza essa Notícia aos usuários no banking conforme seu público alvo, que verá o Conteúdo com texto formatado ao entrar nos detalhes da Notícia


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastrar_conteúdo_video_e_imagem.webm)
    Cenário: Cadastro de Notícia - Inclusão de imagem no Conteúdo, vídeo e formatação
        Dado que o admin está na tela para "Cadastro de Notícias"
        E preenche o campo "Vídeo" com url do "youtube"
        E digita um texto no campo "Conteúdo" aplicando formatações com as opções disponíveis
        E inserir uma imagem através da opção "Inserir imagem" no editor do campo "Conteúdo"
        Quando acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia salva com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe essa Notícia na listagem conforme "título" recém cadastrado
        E disponibiliza essa Notícia aos usuários no banking conforme seu público alvo, que verá o texto formatado, a imagem e o vídeo no conteúdo ao entrar nos detalhes da Notícia


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastrar_conteúdo_sem_segmentação.webm)
    Cenário: Cadastro de Notícia - Com valores válidos nos campos opcionais e sem segmentação
        Dado que o admin está na tela para "Cadastro de Notícias"
        Quando preencher os campos "<Título>", "<Descrição>", "<Imagem>", "<Vídeo>", "<Data de Divulgação>", "<Peso>", "<Conteúdo>", "<Habilitar>", "<Link>"
        Mas não preencher os campos "Grupo", "Rede", "Cargo" 
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia salva com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe a Notícia na listagem conforme "título"  recém cadastrado
        E essas Notícias passam a ficar disponíveis aos usuários no banking conforme suas informações em "<Ação do sistema>"
        Exemplos:
        | Título | Descrição | Imagem         | Vídeo                        | Data de Divulgação | Peso | Conteúdo          | Habilitar | Link                           | Ação do sistema                                                                                                                               |
        | News 0 | Testando  | "fazer upload" | https://youtu.be/eFTsccJ5FUo | 21/09/2022         | 5    | "Descrição longa" | Não       | "bloqueado"                    | Thumb com a imagem anexada, Título, Descrição e data do cadastro; Exibir conforme peso e ID; E sem link/redirecionamento; Conteúdo com vídeo; |
        | News 1 | Testando  | "fazer upload" | https://youtu.be/eFTsccJ5FUo | 21/09/2022         | 5    | "Descrição longa" | Sim       | "https://www.proponto.com.br/" | Thumb com a imagem anexada, Título, Descrição e data do cadastro; Exibir conforme peso e ID; E com link/redirecionamento ao clicar na thumb;  |
        | News 2 | Testando  | "fazer upload" |                              | 21/09/2022         | 4    |                   | Sim       | "https://www.proponto.com.br/" | Thumb com a imagem anexada, Título, Descrição e data do cadastro; Exibir conforme peso; E com link/redirecionamento ao clicar na thumb;       |


@manual
@Tarefa_#:#59197
@Ajuste_#61120
@Ajuste_#61121
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_cadastrar_conteúdo_com_segmentação.webm),[Evidência_2](assets/A_News_cadastro_segmentado_grupo.mp4),[Evidência_3](assets/A_News_segmentação_rede.mp4)
    Cenário: Cadastro de Notícia - Valores válidos em todos os campos e com segmentações
        Dado que o admin está na tela para "Cadastro de Notícias"
        Quando preencher os campos "<Título>", "<Link>" "<Grupo>", "<Rede>", "<Cargo>", "<Data Inicial>", "<Data Final>", "<Arquivo Desktop>", "<Arquivo Mobile>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia salvo com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe o Notícia na listagem conforme "imagem desk", "imagem mobile", "Data final" e "título" recém cadastrado
        E essas Notícias passam a ficar disponíveis aos usuários no banking conforme "<Ação do sistema>" e segmentação aplicada
            Exemplos:
            | Título          | Descrição | Imagem         | Vídeo                        | Data de Divulgação | Peso | Conteúdo          | Grupo      | Rede       | Cargo      | Ação do sistema                                                                                                               |
            | Noticia Teste 1 | Testando  | "fazer upload" | https://youtu.be/eFTsccJ5FUo | 10/10/2022         | 3    | "Descrição longa" | "da lista" | "da lista" | "da lista" | Exibe a notícia para os usuários co Cargo e vinculados a(s) Revenda(s) vinculadas a(s) Rede(s) e Grupo(s) selecionado(s)      |
            | Noticia Teste 2 | Testando  | "fazer upload" | https://youtu.be/6h9mkLonA7s | 'data atual'       | 2    | "Descrição longa" | "da lista" |            |            | Exibe a notícia para os usuários de todas as Revendas vinculadas a(s) Grupo(s) selecionada(s)                                 |
            | Noticia Teste 3 | Testando  | "fazer upload" | https://youtu.be/k5YDRuUpVbY | 'data atual'       | 2    | "Descrição longa" |            | "da lista" |            | Exibe a notícia para os usuários de todas as Revendas vinculadas ao(s) Rede(s) selecionado(s)                                 |
            | Noticia Teste 4 | Testando  | "fazer upload" | https://youtu.be/_K9YV4t9dzY | 10/10/2022         | 2    | "Descrição longa" |            |            | "da lista" | Exibe a notícia para os usuários do(s) Cargo(s) selecionadao(s)                                                               |
            | Noticia Teste 5 | Testando  | "fazer upload" | https://youtu.be/VWAChF3RaY8 | 10/11/2022         | 2    | "Descrição longa" | "da lista" | "da lista" |            | Exibe a notícia para os usuários de todas as Revendas vinculadas ao(s) Grupo(s) e Rede(s) selecionada(s)                      |
            | Noticia Teste 5 | Testando  | "fazer upload" | https://youtu.be/VWAChF3RaY8 | 10/12/2022         | 2    | "Descrição longa" |            | "da lista" | "da lista" | Exibe a notícia para os usuários do(s) Cargo(s) selecionadao(s) e vinculado as Revenda vinculadas a(s) Rede(s) selecionada(s) |


#edição

@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_cancelar.webm)
    Cenário: Editar Notícia - Acessar e Cancelar
        Dado que o admin está na tela de "Notícias"
        E acionou o botão "Ações" de uma Notícia na listagem
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" na url ".../Plataform/Notícia/add/***"
        E o ID deste Notícia será evidenciado no final da url "***"
        E as informações da Notícia virão preenchidos ou vazio quando opcionais conforme já cadastrados
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Notícias"
        E não altera nenhuma informação do Notícia    
        #obs.: por padrão o input de imagens não vem "preenchido" com a imagem anexada


@manual
@Tarefa_#:#59197
@Sugestão_#60845
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_excluir_todos_campos.mp4)
    Cenário: Editar Notícia - Deletar todos os campos e salvar
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        Quando apagar todos os dados
        E acionar o botão "Salvar"
        Então o sistema exibe um alerta no campo de "Preencha este campo" no Título
        E não altera nenhuma informação do Notícia
        E o admin permanece na mesma tela da edição   


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_titulo.mp4)
    Cenário: Editar Notícia - Alterar Título
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        Quando alterar o "Título" e/ou a "Imagem" da Notícia
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe neste Notícia conforme novo "título"
        E altera a imagem da thumb dessa noticia na visão do Banking


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_imagem.mp4)
    Cenário: Editar Notícia - Inserir Imagem em Notícia que não possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        Quando fizer upload de uma imagem no campo "Imagem"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E altera a imagem padrão da campanha na thumb dessa noticia para a imagem anexada, na visão do Banking



@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_data.mp4)
    Cenário: Editar Notícia - Alterar Data de Divulgação futura para vigente
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa Notícia possui uma "Data de Divulgação" para ser exibida no futuro como 30/12/2022
        Quando alterar para uma "Data de Divulgação" igual ou menor que a data atual
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essa Notícia passa a ficar disponível aos usuários no banking 



@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_data_futura.mp4)
    Cenário: Editar Notícia - Alterar Data de Divulgação vigente para futura
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa Notícia possui uma "Data de Divulgação" igual ou menor que a data atual
        Quando alterar para uma "Data de Divulgação" futura, como 01/12/2022
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essa Notícia deixa de ser exibida aos usuários no banking devido a "Data de Divulgação" ser fufura


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](sassets/A_News_editar_sem_data_e_add_data.mp4)
    Cenário: Editar Notícia - Inserir data em Notícia que não possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa Notícia não possui uma "Data de Divulgação"
        Quando preencher o campo com "Data de Divulgação" futura, como 05/12/2022
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essa Notícia deixa de ser exibida aos usuários no banking devido a "Data de Divulgação" ser fufura
        Quando preencher o campo com "Data de Divulgação" igual ou menor que a data atual
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essa Notícia permanece disponível aos usuários no banking, inalterada


@manual
@Tarefa_#:#59197
@Ajuste_#61463
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/A_News_excluir_segmentação.mp4)
    Cenário: Editar Notícia - Remover segmentação de Notícia que possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa Notícia possui alguma segmentação específica
        Quando o admin remover a segmentação
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essa Notícia é disponibilizada para todos os usuários no banking, agora sem segmentação
        | Campo   | Como era   | Como salvar  |
        | Grupo(s)   | "da lista" | "deixar sem" |
        | Rede(s)    | "da lista" | "deixar sem" |
        | Cargo(s)   | "da lista" | "deixar sem" |


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/A_News_add_segmentação.mp4)
    Cenário: Editar Notícia - Incluir segmentação de Notícia que não possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa Notícia não possui segmentação
        Quando preencher os campos "<Grupo>", "<Rede>" e "<Cargo>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essas Notícias passarão a ficar disponíveis somente aos usuários vinculadoas as Revendas e de Cargo conforme cada segmentação aplicada
            Exemplos:
            | Título                                                                          | Grupo      | Rede       | Cargo    |
            | Notícia somente para os cargos das revendas vinculadas ao Grupo e Rede definida | "da lista" | "da lista" | "da lista" |
            | Notícia somente para os cargos definidos                                        |            |            | "da lista" |
            | Notícia somente para usuários das revendas vinculadas ao Grupo e Rede definida  | "da lista" | "da lista" |            |
            | Notícia somente para usuários das revendas vinculadas a Rede definida           |            | "da lista" |            |
            | Notícia somente para usuários das revendas vinculadas ao Grupo definido         | "da lista" |            |            |
        #segmentações multiselect


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:10-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_segmentação.mp4)
    Cenário: Editar Notícia - Alterar segmentação de Notícia que já possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa Notícia já possui segmentação
        Quando alterar os campos "Grupo" e/ou "Rede" e/ou "Cargo" conforme outra opção da lista
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E essas Notícias passarão a ficar disponíveis somente aos usuários vinculadoas as Revendas conforme nova segmentação aplicada


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_descrição.mp4)
    Cenário: Editar Notícia - Alterar a Descrição
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        Quando alterar o texto existente no campo Descrição
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E a descrição na thumb dessa notícia para os usuários do banking é atualizada conforme nova descrição


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:0510-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_remover_descrição.mp4)
    Cenário: Editar Notícia - Remover a Descrição
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa notícia não possui "Descrição" preenchida
        Quando o admin preencher o campo
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E a descrição na thumb dessa notícia para os usuários do banking é removida


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/A_News_editar_peso.mp4)
    Cenário: Editar Notícia - Alterar o peso
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa notícia possui "Peso 5"
        Quando o admin alterar para "Peso 1"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E a exibição da thumb dessa notícia na home dos usuários no banking é atualizada conforme novo peso, saindo da primeira posição para o final
    #quanto maior o peso é exibida primeiro
    #quando mais de uma notícia tem o mesmo peso, o sistema ordena pelo ID mais recente de pesos iguais


@manual
@Tarefa_#:#59197
@Ajuste_#61128
@Ajuste_#61128
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_News_link_redireciomanto.mp4)
    Cenário: Editar Notícia - Alterar o Link para Redirecionamento
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa notícia já possui um Link cadastrado com a opção em "Habilitar" como "Sim"
        Quando o admin alterar a url existente para uma diferente
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E na visualização dos usuários no banking, a partir deste momento, quando o usuário clicar na thumb da notícia seja pela Home ou pela Tela de Notícias, será redirecionado para a nova url em nova aba do navegador


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_News_link_redireciomanto.mp4)
    Cenário: Editar Notícia - Alterar Redirecionamento de "Não" para "Sim"
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        Quando o admin alterar a opção em "Habilitar" de "Não" para "Sim"
        Então o sistema habilita o campo de "Link" para preenchimentos
        Quando o admin preencher com uma "url"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E na visualização dos usuários no banking, a partir deste momento, quando o usuário clicar na thumb da notícia seja pela Home ou pela Tela de Notícias será redirecionado para a respectiva url cadastrada, sem abrir a tela da notícia para exibir seu conteúdo


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_News_link_redirecionamento_2.mp4)
    Cenário: Editar Notícia - Alterar Redirecionamento de "Sim" para "Não"
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição da Notícia"
        E essa notícia já possui um Link cadastrado com a opção em "Habilitar" como "Sim"
        Quando o admin alterar a opção em "Habilitar" para "Não"
        Então o sistema desabilita o campo de "Link"
        E remove o "Link" para redirecionamento desta noticia
        Quando o admin acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Notícia editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E na visualização dos usuários no banking, a partir deste momento, quando o usuário clicar na thumb da notícia seja pela Home ou pela Tela de Notícias, será redirecionado para a tela da notícia com exibição do conteúdo cadastrado


@manual
@Tarefa_#:#59197
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/A_News_log.png)
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
              
#24 CN