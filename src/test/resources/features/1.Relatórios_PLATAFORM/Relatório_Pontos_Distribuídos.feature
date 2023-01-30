#language: pt

Funcionalidade: Admin - Relatório de Pontos Distribuídos
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de pontos distribuídos
Para visualizar e exportar os registros de créditos e débitos dos usuários na campanha

-----

 Critérios de Aceitação:
SELECT * FROM `point_statement` where campaign_id = '' ORDER BY id DESC;
Exibir breadcrumb
Exibir os seguintes filtros: "Tipo", "CPF", "Data inicial", "Data final" e botão "Buscar"
No select Tipo - Lista suspensa com as opções "Débito" e "Crédito" 
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
Exibir um gride/listagem com o seguinte cabeçalho: "Data e hora do pedido", "CPF", "Nome", "Observação", "Tipo", "Pontos" e "Saldo" 
    - data e hora   = `point_statement.registration_date`
    - Observação    = `point_statement.comment`
    - Tipo          = `point_statement.type` (1 débito e 2 crédito)
    - Pontos        = `point_statement.value` 
    - Saldo         = `point_statement.balance` (faz o cálculo conforme cada entrada e saída de ponto da account)
Fazer paginação com 20 registros por página
Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de pedidos, apenas quando existem registros listados
"Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Pontos Distribuídos" na extensão ".xlsx"


---

@manual
@Tarefa_#:#60473
@Ajuste_#60877
@Ajuste_#61393
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Pontos_layout.png)
    Cenário: Pontos Distribuídos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Pontos Distribuídos" será exibido dentre as opções
        Quando o admin clicar no submenu "Pontos Distribuídos"
        Então o sistema rediciona para a tela da listagem de "Relatório de Pontos Distribuídos"
        E os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                     |
            | Filtros     | "Tipo", "CPF", "Data inicial", "Data final"                                      |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                                          |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados xx registros"                   |
            | Listagem    | "Data e hora" do registro, "CPF, "Nome", "Observação", "Tipo", "Pontos", "Saldo" |
            | Botão       | "Exportar Registros" na parte inferior direita da tela                           |



@manual
@Tarefa_#:#60473
@Ajuste_#60888
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência_1](assets/A_Rel_Pontos_nenhum_registro.png),[Evidência_2](assets/A_Rel_Pontos_paginação.mp4)
    Cenário: Pontos Distribuídos - Listagem e Paginação
        Dado que o admin acessou a tela de "Pontos Distribuídos"
        Quando não existem registros na campanha
        Então manter listagem vazia com texto padrão "Nenhum registro encontrado."
        Quando existem
        E a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        E a ordenação dá-se pelo data do registro em decrescente
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros
       


@manual
@Tarefa_#:#60473
@Ajuste_#61395
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Pontos_filtro.mp4)
    Cenário: Pontos Distribuídos - Filtrar
        Dado que o admin acessou a tela de "Pontos Distribuídos"
        Quando "Buscar" por parâmetros que possuam registros existentes na campanha
        Então o sistema vai exibir apenas os registros correspondentes ao filtro aplicado
        Quando "Buscar" por parâmetros não que possuem registros na campanha
        Então o sistema não exibe nada na listagem "Nenhum registro encontrado.", pois não existem registros correspondentes ao filtro aplicado



@manual
@Tarefa_#:#60473
@Ajuste_#61396
@Ajuste_#61445
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_Rel_Ponto_exp.mp4)
    Cenário: Pontos Distribuídos - Exportar Registros
        Dado que o admin acessou a tela de "Pontos Distribuídos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Pontos Distribuídos" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Pontos Distribuídos" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo

#4 CN