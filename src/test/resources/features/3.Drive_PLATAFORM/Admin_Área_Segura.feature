#language: pt

Funcionalidade: Admin - Área Segura
    Como admin administrador ativo na Plataforma
    Quero acessar a módulos de Área Segura
    Para fazer novos cadastros de arquivos
    para disponibilizá-los no drive

        -----

Critérios de Aceitação:
Exibir breadcrumb
Exibir os seguintes filtros:"Nome do arquivo", "Tipo", "Nome do admin", "Data inicial", "Data final" e o botão "Buscar"
No filtro 'Tipo' exibir um select com as opções: "Cadastro", "Pontuação", "Relatório de pedidos", "Outros"
No filtro 'Admin' exibir um select com os admins da campanha
Exibir uma listagem com o cabeçalho: "ID", "i" exibindo Comentário cadastrado, "Nome do arquivo", "Extensão", "Tamanho", "Tipo", "Data", "Admin" e "Ações" com ícone para downaload do arquivo
Disponibilizar um botão "Uplod" para cadastro
Botão "Upload" abre um modal com os campos: "Selecione o Tipo", "Comentário", "Selecione o Arquivo" para upload e texto informativo de "* Limite de 10mb por arquivo." e os botões "Cancelar" e "Enviar"
O sistema não faz upload de arquivo com mais de 10mb e exibe um alerta de impedimento
Na listagem a coluna ações disponibilizá botão para downaload do arquivo
Fazer paginação com 20 registros por página

    ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Área Segura - Acessar e Layout
        Dado que o admin acessou a tela "Área Segura" através do menu Gerencial
        Quando o admin visualizar todos os elementos da tela
        E não houverem arquivos cadastrados
        Então os elementos da tela estão alinhados corretamente
        E a listagem será vazia com o texto "Nenhum registro encontrado."
        Quando houverem arquivos cadastrados
        Então os elementos da tela estão alinhados corretamente
        E a listagem será exibida com as colunas
            | Cabeçalho        | explicação                                                  |
            | "ID"              | gerado pelo sistema                                         |
            | "i"               | exibindo Comentário cadastrado                              |
            | "Nome do arquivo" | conforme nome que veio do computador do admin               |
            | "Extensão"        | conforme o que veio do computador do admin                  |
            | "Tamanho"         | conforme o que veio do computador do admin                  |
            | "Tipo"            | "Cadastro", "Pontuação", "Relatório de pedidos" ou "Outros" |
            | "Data"            | do upload                                                   |
            | "Admin"           | que fez o upload                                            |
            | "Ações"           | com ícone para downaload do arquivo                         |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Área Segura - Botão Upload e Cancelar
        Dado que o admin acessou a tela "Área Segura"
        Quando acionar o botão "Upload"
        Então o sistema abre um modal para cadastro com os campos "Selecione o Tipo", "Comentário", "Selecione o Arquivo" para upload
        E os botões "Cancelar" e "Salvar"
        Quando acionar o botão "Cancelar"
        Então o sistema fecha o modal
        E volta para a listagem de Arquivos da Área Segura



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastrar Arquivo - Campos vazios
        Dado que o admin acessou a tela "Upload"
        Quando acionar o botão "Salvar"
        Mas não preencher o campo "<Selecione o Tipo>"
        E não fazer upload de arquivo em "<Selecione o Arquivo>"
        Então o sistema vai exibir a "<Mensagem do sistema>"
            | <Selecione o Tipo> | <Selecione o Arquivo> | <Mensagem do sistema>       |
            |                    | 'fazer upload'        | Selecione um item da lista  |
            | 'Pontuação'        |                       | Selecione um arquivo        |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastrar Arquivo
        Dado que o admin acessou a tela "Área Segura"
        Quando preencher os campos
        E acionar o botão "Salvar"
        Então o sistema efetiva o cadastro do arquivo, fecha o modal
        E exibe uma mensagem de "Arquivo cadastrado"
        E lista o(s) arquivo(s) na listagem
        Quando informado um Comentário
        Então esse comentário é exibido no 'i' da listagm com o passar do mouse



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Área Segura - Baixar
        Dado que o admin está na listagem de "Área Segura"
        Quando acionar na coluna "Ações" o ícone de downaload
        Então será feito o downaload do respectivo arquivo conforme extensão


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Área Segura - Filtrar
        Dado que o admin está na listagem de "Área Segura"
        Quando "Buscar" por parâmetros que possuam arquivos existentes na listagem
        Então o sistema vai exibir apenas os arquivos correspondentes ao filtro utilizado
        Quando "Buscar" por parâmetros não que possuem arquivos
        Então o sistema não exibe nada, pois não existem arquivos com filtro utilizado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Área Segura - Paginação e transição
        Dado que o admin esta na listagem de "Área Segura"
        Quando a quantidade de registros ultrapassar 10 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cada respectiva página sem apresentar erros


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
            
#8 CN
