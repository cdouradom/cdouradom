#language: pt

Funcionalidade: Admin - Cadastro e Edição de Banner
 Como usuário admin desta campanha
 Quero cadastrar banner de versão desktop e mobile, segmentados e não segmantados
 Para disponibilizar aos participantes da campanha

-----

Critérios de Aceitação:
 O banner cadastrado vigente ou sem data definidas são exibidos para o banking instantaneamente
 Todo banner tem que ter um título
 Todo banner tem que ter um banner desktop
 O título, as imagens do banner e a data final precisam ser exibidas na listagem
 Todas as informações cadastradas precisam ser exibidas na edição do banner
 Toda alteração realizada reflete instantaneamente no banner


 ---

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_cadastro_layout.mp4)
    Cenário: Cadastro de Banner - Acessar, Layout e Cancelar
        Dado que o admin está na listagem de banners
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona para a tela de "Cadastro de Banners" de url ".../Plataform/Banner/add"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Campo                 | Ação                                           |
            | Breadcrumbs           | com redirecionamento ao clique                 |
            | Input Título          | Campo obrigatório alfanumérico                 |
            | Input Link            | Campo opcional                                 |
            | Select Rede           | Campo opcional - Lista de Redes Cadastradas.   |
            | Select Grupo          | Campo opcional - Lista de Grupos Cadastrados   |
            | Select Regionais      | Campo opcional - Lista de Revendas Cadastradas |
            | Input Peso            | Lista numérica de Pesos                        |
            | Input Data Inicial    | Campo opcional - Calendário padrão             |
            | Input Data Final      | Campo opcional - Calendário padrão             |
            | Input Arquivo Desktop | Campo obrigatório - upload de arquivo          |
            | Input Arquivo Mobile  | Campo opcional - upload de arquivo             |
            | Botões de ação        | "Salvar" e "Cancelar"                          |
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Banners"
        E interrompe o cadastro do banner



@manual
@Tarefa_#:#59188
@Sugestão_#60600
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_cadastro_grupo.png)
    Cenário: Cadastro de Banner - Funcionalidade do autocomplete nos selects
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando clicar nos campos de select: "Grupo", "Rede" e "Regionais"
        Então o sistema exibe em lista suspensa com todos os registros de cada campo
        Quando o admin digitar um termo existente em cada select
        Então a listagem exibe somente às opções que possuem o termo digitado em cada campo
        Quando o admin digitar um termo que não existe
        Então a listagem não exibe nada

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/A_Banner_cadastro_campo_vazio&titulo.png),[Evidência_2](assets/A_Banner_cadastro_sem_banner.png),[Evidência_3](),
    Esquema do Cenário: Cadastro de Banner - Com dados obrigatórios não preenchidos
        Dado que o admin acessou a tela para "Cadastro de Banners"
        Quando não preencher os campos obrigatórios: "<Título>", "<Data Inicial>," "<Data Final", "<Arquivo Desktop>" e "<Arquivo Mobile>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Atenção" com a "<Mensagem do sistema>"
        E não faz o cadastro do banner
        E o admin permanece na mesma tela de cadastro
        Exemplos:
            | <Título> | <Data Inicial>   | <Data Final>  | <Arquivo Desktop> | <Arquivo Mobile>  | <Mensagem do sistema>                                                                                                                                                                           |
            |          |                  |               |                   |                   | Informe o título do banner!; Informe a data inicial de apresentação do banner; Informe a data final de apresentação do banner; Faça o upload do banner desktop; Faça o upload do banner mobile; |
            |          | 01/01/2022'      | '31/15/2022'  | 'fazer upload'    | 'fazer upload'    | Informe o título do banner!                                                                                                                                                                     |
            | Teste    |                  | '31/15/2022'  | 'fazer upload'    | 'fazer upload'    | Informe a data inicial de apresentação do banner;                                                                                                                                               |
            | Teste    | 01/01/2022'      |               | 'fazer upload'    | 'fazer upload'    | Informe a data final de apresentação do banner;                                                                                                                                                 |
            | Teste    | 01/01/2022'      | '31/15/2022'  |                   | 'fazer upload'    | Faça o upload do banner desktop;                                                                                                                                                                |
            | Teste    | 01/01/2022'      | '31/15/2022'  | 'fazer upload'    |                   | Faça o upload do banner mobile                                                                                                                                                                  |

#campos de data inicial e final do bannner não estão como obrigatório.

@manual
@Tarefa_#:#59188
@Ajuste_#60637
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/A_Banner_cadastro_campo_data_fin_men_in.png),[Evidência_2](assets/A_Banner_cadastro_data_invalida.mp4),[Evidência_3](assets/A_Banner_cadastro_imagem_invalida.png)
    Esquema do Cenário: Cadastro de Banner - Valores inválidos
        Dado que o admin está na tela para "Cadastro de Banners"
        E preencheu os campos "<Título>", "<Data Inicial>", "<Data Final>", "<Arquivo Desktop>" e "<Arquivo Mobile>" com valores ou arquivo inválidos
        Quando acionar o botão "Salvar"
        Então o sistem sinaliza com a "<Mensagem do sistema>" ou algo similar
            Exemplos:
            | <Título>                           | <Data Inicial>       | <Data Final>         | <Arquivo Desktop>               | <Arquivo Mobile>                | <Mensagem do sistema>                          |
            | "texto com mais de 100 caracteres" | '01/10/2022'         | '01/12/2022'         | 'fazer upload'                  | 'fazer upload'                  | O título deve conter no máximo 100 caracteres  |
            | 'Testando'                         | '01/01/2022'         | '01/11/2022'         | 'fazer upload'                  | 'fazer upload'                  | A data não pode ser retroativa                 |
            | 'Testando'                         | '01/12/2022'         | '01/11/2022'         | 'fazer upload'                  | 'fazer upload'                  | A data final deve ser maior que a data inicial |
            | 'Testando'                         | '01/10/2022'         | '01/12/2022'         | 'extensão # de PNG, JPG e JPEG' | 'fazer upload'                  | São aceitos arquivos PNG, JPG e JPEG           |
            | 'Testando'                         | '01/10/2022'         | '01/12/2022'         | 'extensão # de PNG, JPG e JPEG' | 'fazer upload'                  | A data não pode ser retroativa                 |
            | 'Testando'                         | '31/02/2023'         | '30/15/2023'         | 'extensão # de PNG, JPG e JPEG' | 'extensão # de PNG, JPG e JPEG' | Informe uma data válida                        |
            | 'Testando'                         | '31/14/2022'         | '30/02/2023'         | 'extensão # de PNG, JPG e JPEG' | 'extensão # de PNG, JPG e JPEG' | Informe uma data válida                        |
            | 'Testando'                         | 'texto ou caractere' | 'texto ou caractere' | 'extensão # de PNG, JPG e JPEG' | 'extensão # de PNG, JPG e JPEG' | Informe uma data válida                        |
#limite de quantidade de caracteres para o titulo não considerar 
#para data invalida o sistema esta trocando para uma data valida 

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_cadastro_com_peso.mp4)
    Cenário: Cadastro de Banner - Com peso
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando cadastrar um banner com um peso da lista suspensa neste select
        Então no cadastro de um novo banner essa opção não será exibida na listagem


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_cadastro_valido_e_com_grupo_rede_regional.png)
    Esquema do Cenário: Cadastro de Banner - Valores válidos e com segmentação
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando preencher os campos "<Título>", "<Grupo>", "<Rede>", "<Revenda>", "<Cargo>", "<Arquivo Desktop>", "<Arquivo Mobile>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner salvo com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe o banner na listagem conforme "imagem desk", "imagem mobile" e "título" recém cadastrado
        E estes banners passam a ficar disponíveis aos usuários no banking conforme o público alvo de cada banner
        Exemplos:
            | Título    | Grupo      | Rede       | Regionais  | Data Inicial | Data final   | Arquivo Desktop | Arquivo Mobile |
            | Banner 7  | "da lista" | "da lista" | "da lista" | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 8  | "da lista" |            |            | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 9  |            | "da lista" |            | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 10 |            |            | "da lista" | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 11 |            |            |            | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 12 | "da lista" | "da lista" |            | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 13 |            | "da lista" | "da lista" | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 14 | "da lista" |            | "da lista" | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 15 | "da lista" |            |            | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 16 |            | "da lista" |            | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
            | Banner 17 |            |            | "da lista" | '01/10/2022' | '01/12/2022' | "imagem ok"     | "imagem ok"    |
#mensagem de suscesso ao cadastrar um banner não aparece 


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_cadastro_campos_obrigatórios.mp4)
    Cenário: Cadastro de Banner - Apenas com dados obrigatórios preenchidos
    Dado que o admin está na tela para "Cadastro de Banners"
    Quando preencher somente os campos obrigatórios: "Título", "Data Inicial*," "Data Final*", "Arquivo Desktop" e "Arquivo Mobile*"
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner salvo com sucesso!" ou algo similar
    E redireciona o admin para a listagem
    E exibe esse banner na listagem conforme "imagem desktop", "imagem mobile", 'data final' e "título" recém cadastrado
    E este banner passa a ficar disponível aos usuários no banking para todos os usuários, pois não houve segmentação



@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_cadastro_todos_campos.mp4)
    Esquema do Cenário: Cadastro de Banner - Valores válidos em todos os campos
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando preencher os campos "<Título>", "<Link>" "<Grupo>", "<Rede>", "<Regionais>", "<Peso>", "<Data Inicial>", "<Data Final>", "<Arquivo Desktop>", "<Arquivo Mobile>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner salvo com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe o banner na listagem conforme "imagem desk", "imagem mobile", "Data final" e "título" recém cadastrado
        E estes banners passam a ficar disponíveis aos usuários no banking conforme o público alvo de cada banner
        Exemplos:
            | Título    | Link                         | Grupo      | Rede       | Revenda    | Peso       | Data Inicial | Data Final | Arquivo Desktop | Arquivo Mobile |
            | Banner 18 | https://www.proponto.com.br/ | "da lista" | "da lista" | "da lista" | "da lista" | 01/06/2022   | 31/12/2022 | "imagem"        | "imagem"       |
            | Banner 19 |                              | "da lista" | "da lista" | "da lista" | "da lista" |              | 30/06/2022 | "imagem"        |                |
            | Banner 20 |                              | "da lista" | "da lista" | "da lista" | "da lista" | 01/08/2022   |            | "imagem"        |                |


#edição

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_cancelar.mp4)
    Cenário:Editar Banner - Acesso, Layout e Cancelar
        Dado que o admin está na tela de "Banners"
        E acionou o botão "Ações" de uma banner na listagem
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" na url ".../Plataform/Banner/add/***"
        E o ID deste banner será evidenciado no final da url "***"
        E os campos deste banner serão exibidos preenchidos conforme já cadastrados
        Quando o admin acionar o botão "Cancelar" na edição de um banner
        Então o sistema redireciona o admin para a listagem de "Banners"
        E não altera nenhuma informação do banner
        #obs.: por padrão os inputs de imagens não vem "preenchidos" com as imagens anexas


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_sem_dados.mp4)
    Cenário: Editar Banner - Deletar todos os campos e salvar
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        Quando apagar todos os dados
        E acionar o botão "Salvar"
        Então o sistema sinaliza com as mensagens de campos obrigatórios
        E não altera nenhuma informação do banner
        E o admin permanece na mesma tela da edição   


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_titulo.mp4)
    Cenário: Editar Banner - Alterar Título
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        Quando alterar o "Título" do banner
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe neste banner conforme novo "título"


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_imagens.webm)
    Cenário: Editar Banner - Alterar Imagens
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        Quando fizer upload de novas imagens nos campos "<Arquivo Desktop>", "<Arquivo Mobile>" deste banner
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe neste banner as novas imagens


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_data.webm)
    Cenário: Editar Banner - Alterar data final vencida para vigente
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner possui uma "Data Final" passada
        Quando alterar para uma "Data Final" futura, maior que a data inicial
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe neste banner a nova "Data Final"
        E este banner passa a ficar disponível aos usuários no banking conforme seu público alvo caso segmentado


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_data_inicial.webm)
    Cenário: Editar Banner - Alterar data inicial futura para vigente
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner possui uma "Data Inicial" futura
        Quando alterar para uma "Data Inicial" igual ou maior enor que a data atual
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E este banner passa a ficar disponível aos usuários no banking conforme seu público alvo caso segmentado


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_remover_segmentação.webm)
    Cenário: Editar Banner - Remover segmentação de banner que possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E esta banner possui segmentação específica
        Quando o admin remover a segmentação
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E este banner que era restrito ao seu público alvo passa a ficar disponível para todos os usuários no banking, pois agora não possui segmentação
            | Campo     | Como era   | Como salvar  |
            | Grupo     | "da lista" | "deixar sem" |
            | Rede      | "da lista" | "deixar sem" |
            | Regioanal | "da lista" | "deixar sem" |


@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_add_segmentação.webm)
    Cenário: Editar Banner - Incluir segmentação de banner que não possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner não possui segmentação
        Quando preencher os campos "<Grupo>", "<Rede>", "<Regioanal>"  aplicando segmentação
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E estes banners passarão a ficar disponíveis somente aos usuários conforme cada segmentação aplicada
            | Título    | Grupo      | Rede       | Regioanal  | 
            | Banner 7  | "da lista" | "da lista" | "da lista" | 
            | Banner 10 |            |            | "da lista" | 
            | Banner 11 |            |            |            |
            | Banner 12 | "da lista" | "da lista" |            |
            | Banner 16 |            | "da lista" |            | 

@manual
@Tarefa_#:#59188
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_editar_segmentacao.webm)
    Cenário: Editar Banner - Alterar segmentação de banner que possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner já possui segmentação
        Quando alterar os campos "Grupo", "Rede", "Regioanal" conforme outra opção da lista
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E estes banners passarão a ficar disponíveis somente aos usuários conforme nova segmentação aplicada

@manual
@Tarefa_#:#59188
@Ajuste_#60987
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Banner_log.png)
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


#18 CN