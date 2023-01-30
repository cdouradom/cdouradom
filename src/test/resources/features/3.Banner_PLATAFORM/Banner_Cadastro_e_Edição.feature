#language: pt

Funcionalidade: Admin - Cadastro e Edição de Banner
 Como usuário admin desta campanha
 Quero cadastrar banner de versão desktop e mobile, segmentados e não segmantados
 Para disponibilizar aos participantes da campanha

---

Critérios de Aceitação:
 O banner cadastrado vigente ou sem data definidas são exibidos para o banking instantaneamente
 Todo banner tem que ter um título
 Todo banner tem que ter um banner desktop
 O título, as imagens do banner e a data final precisam ser exibidas na listagem
 Todas as informações cadastradas precisam ser exibidas na edição do banner
 Toda alteração realizada reflete instantaneamente no banner


 ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Banner - Acessar, Layout e Cancelar
        Dado que o admin está na listagem de banners
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona para a tela de "Cadastro de Banners" de url ".../Plataform/Banner/add"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Campo                 | Ação                                  |
            | Breadcrumbs           | com redirecionamento ao clique        |
            | Input Título          | Campo obrigatório alfanumérico        |
            | Input Link            | Campo opcional                        |
            | Input Data Inicial    | Campo opcional - Calendário padrão    |
            | Input Data Final      | Campo opcional - Calendário padrão    |
            | Input Arquivo Desktop | Campo obrigatório - upload de arquivo |
            | Input Arquivo Mobile  | Campo opcional - upload de arquivo    |
            | Input Perfil          | Campo opcional - seleção do perfil    |
            | Input Grupo           | Campo opcional - seleção do grupo     |
            | Input Região          | Campo opcional - seleção da região    |
            | Input Segmento        | Campo opcional - seleção do segmento  |
            | Botões de ação        | "Salvar" e "Voltar"                   |
        Quando acionar o botão "Voltar"
        Então o sistema redireciona o admin para a listagem de "Banners"
        E interrompe o cadastro do banner


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Cadastro de Banner - Com dados obrigatórios não preenchidos
        Dado que o admin acessou a tela para "Cadastro de Banners"
        Quando não preencher os campos obrigatórios: "<Título>" e "<Arquivo Desktop>"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Atenção" com a "<Mensagem do sistema>"
        E não faz o cadastro do banner
        E o admin permanece na mesma tela de cadastro
        Exemplos:
            | <Título> | <Arquivo Desktop> | <Mensagem do sistema> |
            |          |                   | Preencha este campo   |
            |          | 'fazer upload'    | Preencha este campo   |
            | Teste    |                   | Selecione um arquivo  |
                                                                                                                                                                  

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Banner - Valores válidos e com segmentação
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando preencher os campos "Título", "Link", "Data Inicial", "Data Final", "Arquivo Desktop", "Arquivo Mobile", "Perfil", "Grupo", "Região" e "Segmento"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner salvo com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe o banner na listagem conforme "imagem desk", "imagem mobile" e "título" recém cadastrado
        E estes banners passam a ficar disponíveis aos usuários no banking conforme o público alvo de cada banner


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Banner - Apenas com dados obrigatórios preenchidos
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando preencher somente os campos obrigatórios: "Título" e "Arquivo Desktop"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner salvo com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe esse banner na listagem conforme "imagem desktop" e "título" recém cadastrado
        E este banner passa a ficar disponível aos usuários no banking para todos os usuários, pois não houve segmentação


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Banner - Valores válidos em todos os campos
        Dado que o admin está na tela para "Cadastro de Banners"
        Quando preencher os campos "Título", "Link", "Data Inicial", "Data Final", "Arquivo Desktop", "Arquivo Mobile", "Perfil", "Grupo", "Região" e "Segmento"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner salvo com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe o banner na listagem conforme "imagem desk", "imagem mobile", "Data final" e "Título" recém cadastrado
        E estes banners passam a ficar disponíveis aos usuários no banking conforme o público alvo de cada banner
       

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Acesso, Layout e Cancelar
        Dado que o admin está na tela de "Banners"
        E acionou o botão "Ações" de uma banner na listagem
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" na url ".../Plataform/Banner/add/***"
        E o ID deste banner será evidenciado no final da url "***"
        E os campos deste banner serão exibidos preenchidos conforme já cadastrados
        Quando o admin acionar o botão "Cancelar" na edição de um banner
        Então o sistema redireciona o admin para a listagem de "Banners"
        E não altera nenhuma informação do banner
        

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Deletar todos os campos e salvar
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        Quando apagar todos os dados
        E acionar o botão "Salvar"
        Então o sistema sinaliza com as mensagens de campos obrigatórios
        E não altera nenhuma informação do banner
        E o admin permanece na mesma tela da edição   


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Alterar Título
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        Quando alterar o "Título" do banner
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe neste banner conforme novo "título"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Alterar Imagens
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        Quando fizer upload de novas imagens nos campos "<Arquivo Desktop>", "<Arquivo Mobile>" deste banner
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E exibe neste banner as novas imagens


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
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
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Alterar data inicial futura para vigente
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner possui uma "Data Inicial" futura
        Quando alterar para uma "Data Inicial" igual ou maior que a data atual
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E este banner passa a ficar disponível aos usuários no banking conforme seu público alvo caso segmentado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Remover segmentação de banner que possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E esta banner possui segmentação específica
        Quando o admin remover a segmentação
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E este banner que era restrito ao seu público alvo passa a ficar disponível para todos os usuários no banking, pois agora não possui segmentação
            | Campo    | Como era   | Como salvar  |
            | Perfil   | "da lista" | "deixar sem" |
            | Grupo    | "da lista" | "deixar sem" |
            | Região   | "da lista" | "deixar sem" |
            | Segmento | "da lista" | "deixar sem" |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Incluir segmentação de banner que não possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner não possui segmentação
        Quando preencher os campos "Perfil", "Grupo", "Região" e "Segmento" aplicando segmentação
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E estes banners passarão a ficar disponíveis somente aos usuários conforme cada segmentação aplicada
       

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar Banner - Alterar segmentação de banner que possui
        Dado que o admin acionou a opção "Alterar" 
        E está na tela para "Edição do Banner"
        E este banner já possui segmentação
        Quando alterar os campos "Perfil", "Grupo", "Região" e "Segmento" conforme outra opção da lista
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Banner editado com sucesso!" ou algo similar
        E redireciona o admin para a listagem
        E estes banners passarão a ficar disponíveis somente aos usuários conforme nova segmentação aplicada

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


#15 CN