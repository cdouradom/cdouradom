#language: pt

Funcionalidade: Admin - Relatório de Pedidos
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de pedidos
Para visualizar e exportar os registros de pedidos dos usuários na campanha

-----

 Critérios de Aceitação:
SELECT *FROM orders where account_campaign_id = '' ORDER BY id DESC;
Exibir breadcrumb
Exibir os seguintes filtros: "Número do pedido", "CPF/CNPJ", "Data inicial", "Data final" e botão "Buscar"
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados "X" registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "Data e hora do pedido", "Número do pedido", "CPF/CNPJ", "Nome", "Valor", "Status" e botão "Detalhes"
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar" para download do relatório de pedidos, "apenas quando existem registros listados"
Botão "Detalhes" redireciona para outra tela com os detalhes do respectivo pedido
Tela de "Detalhes" tem botão "Voltar aos pedidos" no topo lateral
Botão "Voltar aos pedidos" volta para a listagem de pedidos
Tela de "Detalhes" é composta por seções com dados do usuário que fez o pedido, dados do resgate, item(ns), valor do produto, valor de frete, valor total, timeline de atualização de status, botão Ver histório e NF

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Pedidos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Pedidos" será exibido dentre as opções
        Quando o admin clicar no submenu "Pedidos"
        Então o sistema rediciona para a tela da listagem de "Pedidos"
        E os elementos abaixo serão exibidos
            | Breadcrumbs      | Com o Caminho para essa tela                                                                     |
            | Título           | "Pedidos"                                                                                        |
            | Região "Filtros" | Campos "Número do Pedido", "CPF/CNPJ", "Data inicial" e "Data final"                             |
            | Região "Filtros" | Botão "Buscar"                                                                                   |
            | Listagem         | "Data e hora", "Número do Pedido", "Nome e CPF do Usuário", "Valor", "Status" e botão "Detalhes" |
            | Rodapé           | Texto informativo: "Foram encontrados "X" registros"                                             |
            | Rodapé           | Paginação                                                                                        |
            | Rodapé           | Botão "Exportar"                                                                                 |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Pedidos - Detalhes - Acessar e Layout
        Dado que o admin acessou a tela de "Pedidos"
        Quando acionar o botão "Detalhes" em um pedido da listagem
        Então o sistema redireciona para a tela "Detalhes do Pedido"
        E os elementos abaixo serão exibidos
            | Breadcrumbs                          | Com o Caminho para essa tela                                                        |
            | Título                               | "Detalhes do Pedido"                                                                |
            | Botão                                | "Voltar aos Pedidos"                                                                |
            | Texto informativo com o nº do pedido | "Pedido: XXXXXXXXXX" (número do pedido)                                             |
            | Região de dados do usuário e pedido  | "Data e hora do pedido", "Nome do usuário", "CPF/CNPJ", "email do usuário"          |
            | Região de dados do usuário e pedido  | "valor total do pedido" Forma de pagamento                                          |
            | Totalizadores                        | "Total dos itens", "Total do Frete", "Total"                                        |
            | Timeline de progresso                | "status / progresso" da entrega                                                     |
            | Botão "Ver Histórico"                | "Botão que abre um modal com hiatórico" botão "Nota Fiscal" dentro deste modal      |
            | Botão "Nota Fiscal"                  | Abre nova aba e exibe a nota fiscal no visualizador de PDF, com opção para download |
  

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pedidos - Listagem e Paginação - Sem Pedidos
        Dado que o admin acessou a tela de "Pedidos"
        Quando não existe nenhum pedido na campanha
        Então a listagem fica vazia com texto padrão "Nenhum registro encontrado."
        E nenhuma paginação é demonstrada
        E o botão "Exportar" não é exibido


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pedidos - Listagem e Paginação - Com Pedidos
        Dados que o admin acessou a tela de "Pedidos"
        Quando existem pedidos na campanha
        Então no rodapé é demonstrado o texto informativo "Foram encontrados "X" resultados" (quantidade total de pedidos)
        Quando a quantidade de registros ultrapassar 20 linhas
        Então é exibida a paginação
        E a ordenação dá-se pelo data do pedido decrescente
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros
       

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pedidos - Filtrar
        Dado que o admin acessou a tela de "Pedidos"
        Quando "Buscar" por parâmetros que possuam registros existentes na campanha
        Então o sistema vai exibir apenas os registros correspondentes ao filtro aplicado
        Quando "Buscar" por parâmetros não que possuem registros na campanha
        Então o sistema não exibe nada na listagem "Nenhum registro encontrado.", pois não existem registros correspondentes ao filtro aplicado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Cenário: Pedidos - Exportar Registros
        Dado que o admin acessou a tela de "Pedidos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar"
        Então o sistema irá fazer o download do arquivo "Relatório de Pedidos" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin executar a busca sem nenhum filtro
        E acionar o botão "Exportar"
        Então o sistema irá fazer o download do arquivo "Relatório de Pedidos" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:
    Esquema do Cenário: Pedidos - Filtrar com valores exixtentes e inexistentes
    Dado que o admin acessou a tela "Pedidos"
    Quando aplicou os filtros "<Número do Pedido>", "<CPF/CNPJ>", "<Data Inicial>" e "<Data Final>"
    E acionou o botão "Buscar"
    Então o sistema exibiu o "<Resultado do Sistema>"
            | <Número do Pedido> | <CPF/CNPJ> | <Data Inicial>       | <Data Final>         | <Resultado do Sistema>                                                    |
            | Existente          | Vazio      | Vazio                | Vazio                | Retorna o pedido que contém o termo filtrado                              |
            | Vazio              | Existente  | Vazio                | Vazio                | Retorna todos os pedidos do CPF/CNPJ filtrado                             |
            | Vazio              | Vazio      | Contemplando pedidos | Vazio                | Retorna todos os pedidos cuja data é igual ou maior que o filtro aplicado |
            | Vazio              | Vazio      | Vazio                | Contemplando pedidos | Retorna todos os pedidos cuja data é igual ou menor que o filtro aplicado |
            | Vazio              | Vazio      | Contemplando pedidos | Contemplando pedidos | Retorna todos os pedidos cuja data está dentro do período filtrado        |
            | Existente          | Existente  | Contemplando pedidos | Contemplando pedidos | Retorna o pedido que contém o termo filtrado                              |
            | Vazio              | Vazio      | Vazio                | Vazio                | Retorna todos os pedidos existentes                                       |
            | Inexistente        | Vazio      | Vazio                | Vazio                | Não retorna nenhum resultado                                              |
            | Vazio              | Inexistente| Vazio                | Vazio                | Não retorna nenhum resultado                                              |
            | Vazio              | Vazio      | Não contempla        | Vazio                | Não retorna nenhum resultado                                              |
            | Vazio              | Vazio      | Vazio                | Não contempla        | Não retorna nenhum resultado                                              |
            | Inexistente        | Inexistente| Não contempla        | Não contempla        | Não retorna nenhum resultado                                              |

