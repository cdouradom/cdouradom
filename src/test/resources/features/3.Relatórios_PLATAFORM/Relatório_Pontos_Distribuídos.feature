#language: pt

Funcionalidade: Admin - Relatório de Pontos Distribuídos
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de pontos distribuídos
Para visualizar e exportar os registros de créditos e débitos dos usuários na campanha

-----

Critérios de Aceitação:
SELECT * FROM `point_statement` where campaign_id = '' ORDER BY id DESC;
Exibir breadcrumb
Exibir os seguintes filtros: "Tipo", "CPF/CNPJ", "Data inicial", "Data final" e botão "Buscar"
No select Tipo - Lista suspensa com as opções "Débito" e "Crédito" 
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados "X" registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "Tipo", "Data e hora do pedido", "Usuário", "Pontos", "Saldo" e "Descrição"
    - data e hora   = `point_statement.registration_date`
    - Observação    = `point_statement.comment`
    - Tipo          = `point_statement.type` 
    - Pontos        = `point_statement.value` 
    - Saldo         = `point_statement.balance`
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar" para download do relatório de pedidos, apenas quando existem registros listados
"Exportar" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Pontos Distribuídos" na extensão ".xlsx"

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pontos Distribuídos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Pontos Distribuídos" será exibido dentre as opções
        Quando o admin clicar no submenu "Pontos Distribuídos"
        Então o sistema redireciona para a tela da listagem de "Extrato de Pontos"
        E os elementos abaixo serão exibidos
            | Breadcrumbs      | Com o Caminho para essa tela                                                                               |
            | Título           | "Extrato de Pontos"                                                                                        |
            | Região "Filtros" | Campos "Tipo" (Crédito Resgatado ou Debitado / Crédito Liberado), "CPF/CNPJ", "Data inicial"e "Data final" |
            | Região "Filtros" | Botão "Buscar"                                                                                             |
            | Listagem         | Legendas (Crédito Liberado / Crédito Resgatado ou Debitado)                                                |
            | Listagem         | "Tipo", "Data e Hora", "Nome e CPF/CNPJ do usuário", "Pontos", "Saldo" e "Descrição"                       |
            | Rodapé           | Texto informativo: "Foram encontrados "X" resultados. (quantidade de registros)"                           |
            | Rodapé           | Paginação                                                                                                  |
            | Rodapé           | Botão "Exportar"                                                                                           |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pontos Distribuídos - Listagem e Paginação - Sem Dados
        Dado que o admin acessou a tela de "Extrato de Pontos"
        Quando não existe nenhum registro
        Então a listagem fica vazia com texto padrão "Nenhum registro encontrado."
        E nenhuma paginação é demonstrada
        E o botão "Exportar" não é exibido
       

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pontos Distribuídos - Listagem e Paginação - Com Dados
        Dados que o admin acessou a tela de "Extrato de Pontos"
        Quando existem registros
        Então no rodapé é demonstrado o texto informativo "Foram encontrados "X" resultados" (quantidade total de registros)
        Quando a quantidade de registros ultrapassar 20 linhas
        Então é exibida a paginação
        E a ordenação dá-se pelo data do registro decrescente
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pontos Distribuídos - Exportar Registros
        Dado que o admin acessou a tela de "Extrato de Pontos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar"
        Então o sistema irá fazer o download do arquivo "Relatório de Pontos Distribuídos" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin executar a busca sem nenhum filtro
        E acionar o botão "Exportar"
        Então o sistema irá fazer o download do arquivo "Relatório de Pontos Distribuídos" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Pontos Distribuídos - Filtrar com valores exixtentes e inexistentes
    Dado que o admin acessou a tela "Extrato de Pontos"
    Quando aplicou os filtros "<Tipo>", "<CPF/CNPJ>", "<Data Inicial>" e "<Data Final>"
    E acionou o botão "Buscar"
    Então o sistema exibiu o "<Resultado do Sistema>"
            | <Tipo>      | <CPF/CNPJ>  | <Data Inicial>          | <Data Final>            | <Resultado do Sistema>                                                      |
            | Da lista    | Vazio       | Vazio                   | Vazio                   | Retorna o registro que contém o termo filtrado                              |
            | Vazio       | Existente   | Vazio                   | Vazio                   | Retorna todos os registros do CPF/CNPJ filtrado                             |
            | Vazio       | Vazio       | Contemplando resultados | Vazio                   | Retorna todos os registros cuja data é igual ou maior que o filtro aplicado |
            | Vazio       | Vazio       | Vazio                   | Contemplando resultados | Retorna todos os registros cuja data é igual ou menor que o filtro aplicado |
            | Vazio       | Vazio       | Contemplando resultados | Contemplando resultados | Retorna todos os registros cuja data está dentro do período filtrado        |
            | Da lista    | Existente   | Contemplando resultados | Contemplando resultados | Retorna o pedido que contém o termo filtrado                                |
            | Vazio       | Vazio       | Vazio                   | Vazio                   | Retorna todos os registros existentes                                       |
            | Vazio       | Inexistente | Vazio                   | Vazio                   | Não retorna nenhum resultado                                                |
            | Vazio       | Vazio       | Não contempla           | Vazio                   | Não retorna nenhum resultado                                                |
            | Vazio       | Vazio       | Vazio                   | Não contempla           | Não retorna nenhum resultado                                                |
            | Vazio       | Inexistente | Não contempla           | Não contempla           | Não retorna nenhum resultado                                                |
