#language: pt

Funcionalidade: Admin - Relatório de Pedidos
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de pedidos
Para visualizar e exportar os registros de pedidos dos usuários na campanha

-----

 Critérios de Aceitação:
SELECT *FROM orders where account_campaign_id = '' ORDER BY id DESC;
Exibir breadcrumb
Exibir os seguintes filtros: "Número do pedido", "CPF", "Data inicial", "Data final", "Resultados por página" e botão "Buscar"
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "Data e hora do pedido", "Número do pedido", "CPF", "Nome", "Pontos", "Status" e botão "Detalhes"
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de pedidos, "apenas quando existem registros listados"
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Pedidos" na extensão ".xlsx"
Botão "Detalhes" redireciona para outra tela com os detalhes do respectivo pedido
Tela de "Detalhes" tem botão "Voltar aos pedidos" no topo lateral
Botão "Voltar aos pedidos" volta para a listagem de pedidos
Tela de "Detalhes" é composta por seções com dados do usuário que fez o pedido, dados do resgate, item(ns), valor do produto, valor de frete, valor total, timeline de atualização de status, botão Ver histório e NF

---

@manual
@Tarefa_#:#60473
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Pedidos_layout.png)
    Cenário: Pedidos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Pedidos" será exibido dentre as opções
        Quando o admin clicar no submenu "Pedidos"
        Então o sistema rediciona para a tela da listagem de "Relatório de Pedidos"
        E os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                                      |
            | Filtros     | "Número do Pedido", "CPF", "Data inicial", "Data final" e "Resultados por página"                 |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                                                           |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados xx registros"                                    |
            | Listagem    | "Data e hora" do resgate, "Número do Pedido", "CPF, "Nome", "Pontos", "Status" e botão "Detalhes" |
            | Botão       | "Exportar Registros" na parte inferior direita da tela                                            |

@manual
@Tarefa_#:#60473
@Ajuste_#61389
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Pedidos_detalhes_layout.png)
    Cenário: Pedidos Detalhes - Acessar e Layout
        Dado que o admin acessou a tela de "Pedidos"
        Quando acionar o botão "Detalhes" em um pedido da listagem
        Então o sistema redireciona para outra tela com os detalhes do respectivo pedido
        E os elementos abaixo serão exibidos
            | Breadcrumbs                | Com o Caminho para essa tela                                                        |
            | Botão "Voltar aos Pedidos" | volta para a listagem de pedidos                                                    |
            | Pedido:00000000000'        | com u núemro do respectivo pedido                                                   |
            | 1/3 box na horizontal      | "Data do pedido", "Nome do usuário", "CPF/CNPJ", "email do usuário"                 |
            | 2/3 box na horizontal      | "email" ou "endereço" do usuario                                                    |
            | 3/3 box na horizontal      | "valor total do pedido" Forma de pagamento                                          |
            | Relatório de tela          | "Item", "qnt", "preço unit", "frete", "Status" e "sobtotal"                         |
            | Timeline de progresso      | "status / progresso" da entrega                                                     |
            | Botão "Ver Histórico"      | "Botão que abre um modal com hiatórico" botão "Nota Fiscal" dentro deste modal      |
            | Botão "Nota Fiscal"        | Abre nova aba e exibe a nota fiscal no visualizador de PDF, com opção para download |
            | Totalizadores              | "Produto" com qnt, "Pontos", "Frete", "Total"                                       |

@manual
@Tarefa_#:#60473
@Anulado_#60894
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência_1](assets/A_Rel_Pedidos_sem_pedidos.png),[Evidência_2](assets/A_Rel_Pedidos_paginação.mp4)
    Cenário: Pedidos - Listagem e Paginação
        Dado que o admin acessou a tela de "Pedidos"
        Quando não existem resgates na campanha
        Então manter listagem vazia com texto padrão "Nenhum registro encontrado."
        Quando existem
        E a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        E a ordenação dá-se pelo data do pedido decrescente
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros
       


@manual
@Tarefa_#:#60473
@Ajuste_#60889
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Pedidos_filtros.mp4)
    Cenário: Pedidos - Filtrar
        Dado que o admin acessou a tela de "Pedidos"
        Quando "Buscar" por parâmetros que possuam registros existentes na campanha
        Então o sistema vai exibir apenas os registros correspondentes ao filtro aplicado
        Quando "Buscar" por parâmetros não que possuem registros na campanha
        Então o sistema não exibe nada na listagem "Nenhum registro encontrado.", pois não existem registros correspondentes ao filtro aplicado



@manual
@Tarefa_#:#60473
@Ajuste_#61390
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Pedidos_exp.mp4)
    Cenário: Pedidos - Exportar Registros
        Dado que o admin acessou a tela de "Pedidos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Pedidos" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Pedidos" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo

#5 CN