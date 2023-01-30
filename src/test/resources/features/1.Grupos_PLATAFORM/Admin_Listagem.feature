#language: pt

Funcionalidade: Admin - Listagem de Grupos
Como usuário administrador ativo na Plataforma
Quero visualizar os Grupos da campanha
Para realizar buscas, ações e exportar os registros

    BD 
        account_campaign_company
-----

Critérios de Aceitação:
Exibir breadcrumb
Exibir os seguintes filtros: "ID do Grupo", "Grupo" e botão "Buscar"
Exibir no parte superior direita da tela o botão "Cadastrar Grupo" 
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "ID do Grupo", "Grupo" e botão "Editar"
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de Grupos, apenas quando existem registros listados
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Grupos" na extensão ".xlsx"

---

@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_layout.png)
    Cenário: Grupos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Gerencial"
        Então o submenu "Grupos" será exibido dentre as opções
        Quando o admin clicar no submenu "Grupos"
        Então o sistema rediciona para a tela da listagem de "Grupos"
        Quando o sistema redirecionar o admin para a tela dos Grupos
        Então os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                  |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados X registros" |
            | Botão       | "Cadastrar Grupo" na parte superior direita da tela           |
            | Filtros     | "ID Grupo"; "Grupo"                                           |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                       |
            | Listagem    | ID Grupo em ordem descrescente; Grupo; Ações: "Editar"        |
            | Botão       | "Exportar Registros" na parte inferior direita da tela        |

@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_filtros.webm)
    Cenário: Grupos - Filtrar
        Dado que o admin esta na tela de Grupos
        Quando preencher com "ID Grupo" e "Grupo" um valor existente para essa campanha
        E clicar em "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados 1 registros"
        E exibirá no gride somente o registro respectivo a busca  
        Quando preencher no input "ID Grupo" e "Grupo" um valor não existente para essa campanha
        E clicar em "Buscar"
        Então o sistema vai sinalizar com a mensagem "Nenhum registro encontrado."
        E não exibirá o texto informativo de "Resultados", pois não existe
        E não disponibiliza o botão "Exportar Registros"
        

@manual
@Tarefa_#:#59189
@Ajuste_#60224
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_filtrar_exportar.mp4)
    Cenário: Grupos - Exportar Registros com filtro aplicado
        Dado que o admin esta na tela de "Grupos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo
        E deve ser conforme o modelo requerido em escopo


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_Exportar_sem_filtro.mp4)
    Cenário: Grupos - Exportar Registros sem filtro aplicado
        Dado que o admin esta na tela de "Grupos"
        Mas não realizou buscas
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo
        E deve ser conforme o modelo requerido em escopo

@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_paginacao.mp4)
Cenário: Grupos - Paginação e transição
    Dado que o admin esta na listagem de "Grupos"
    Quando a quantidade de registros ultrapassar 20 linhas
    Então deve-se gerar paginação
    Quando o admin acionar a transição de páginas
    Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros

#5 CN