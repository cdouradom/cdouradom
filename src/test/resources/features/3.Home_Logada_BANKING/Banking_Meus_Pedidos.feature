#language: pt

Funcionalidade: Banking - Meus Pedidos
 Como usuário cadastrado e ativo na campanha
 Quero acessar os meus pedidos
 Para acompanhar o andamento dos meus resgates 

-----

 Critérios de Aceitação:
SELECT *FROM orders where account_id = '' ORDER BY id DESC;
Exibir os filtros por "Numero do Pedido", "Data inicial" e "Data final" e botão "Buscar"
Exibir uma listagem com as colunas 'Pedido', 'Data', 'Pontos' e botão "Detalhes"
Botão "Detalhes" redireciona para outra tela com os detalhes do respectivo resgate
Tela de "Detalhes" é composta por seções de dados do usuário, dados do resgate, item(ns), valor do produto, valor de frete, valor total, timeline de atualização de status, botão Ver histório e NF
São exibidos somente os resgates do respectivo usuário logado
Ao fazer um filtro a listagem é atualizada conforme filtro aplicado, trazendo ou não resultados

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Meus Pedidos - Acessar e Layout
        Dado que o usuário acessou "Meus Pedidos"
        Quando visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs                                           |
            | Filtro 'Número do Pedido'                             |
            | Filtros Data Inicial e "Data Final                    |
            | Botão Buscar                                          |
            | Listagem dos resgates do usuáro logado                |
            | Colunas 'Pedido', 'Data', 'Pontos' e botão "Detalhes" |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Meus Pedidos - Listagem e Paginação
        Dado que o usuário acessou "Meus Pedidos"
        Quando o usuário não possui resgates realizados
        Então manter listagem vazia com texto padrão "Nenhum registro encontrado."
        Mas quando o usuário logado possui resgates realizados
        Então exibir na listagem os pedidos do usuário logado
        E os registros são exibidos em ordem decrescente pela Data do resgate
        E cada pedido terá um botão "Detalhes"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o usuário acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Meus Pedidos - Detalhes, Histórico e NF
        Dado que o usuário acessou "Meus Pedidos"
        Quando acionar o botão "Detalhes" de um resgate
        Então o sistema redireciona para os detalhes do pedido
        Quando visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente      
        E ao final dos detalhes do resgate terá um botão "Ver Histórico" sendo dos status/andamento do pedido
        Quando o usuário acionar o botão "Ver Histórico"
        Então o sistema exibe um modal com os logs do andamento do pedido
        E com um botão "Nota Fiscal" #para pedido sem nota não terá NF
        Quando o usuário clicar no botão "Nota Fiscal"
        Então o sistema redirecionar para uma nova aba exibindo a nota fiscal no visualizador de PDF, com opção para download



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Meus Pedidos - Filtrar
        Dado que o usuário acessou "Meus Pedidos"
        Quando "Buscar" por parâmetros que possuam registros existentes do usuário logado
        Então o sistema vai exibir apenas os registros correspondentes ao filtro aplicado
        Quando "Buscar" por parâmetros não que possuem registros para o usuário logado
        Então o sistema não exibir nada, pois não existem registros correspondentes ao filtro aplicado


#4 CN