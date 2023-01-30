#language: pt

Funcionalidade: Admin - Relatório de Acessos
    Como usuário administrador ativo na Plataforma
    Quero acessar o relatório de acessos
    Para visualizar e exportar os acessos dos usuários na campanha

    -----

    SELECT * FROM `login_access_log`
    JOIN account ON login_access_log.account_id = account.id
    WHERE account.account_parent_id = 731469

    Critérios de Aceitação:
    Exibir breadcrumb
    Exibir os seguintes filtros: "CPF", "Nome", "Data inicial", "Data final" e botão "Buscar"
    Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
    Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
    Exibir um gride/listagem com o seguinte cabeçalho: "CPF", "Nome" e "Último Acesso"
    Fazer paginação com 20 registros por página
    Disponibilizar na parte inferior direita da tela o botão "Exportar Registros" para download do relatório de acessos, apenas quando existem registros listados
    "Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Acessos" na extensão ".xlsx"

    ---

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_acessos-acessar-e-layout.mp4)
    Cenário: Acessos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Acessos" será exibido dentre as opções
        Quando o admin clicar no submenu "Acessos"
        Então o sistema rediciona para a tela da listagem de "Relatório de Acessos"
        Quando o sistema redirecionar o admin para a tela das Redes
        Então os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                    |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados * registros"                   |
            | Filtros     | "CPF", "Nome", "Data inicial", "Data final"                                     |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                                         |
            | Listagem    | "CPF" com máscara, "Nome" completo do usuário e "Último Acesso" com data e hora |
            | Botão       | "Exportar Registros" na parte inferior direita da tela                          |



@manual
@Tarefa_#60473
@Sugestão_#60853
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_acessos-filtrar-com-valores-existentes-v2.mp4)
    Cenário: Acessos - Filtrar com valores existentes
        Dado que o admin esta na tela "Relatório de Acessos"
        Quando preencher os filtros "<CPF>", "<Nome>", "<Data inicial>", "<Data final>" com valores existentes
        E clicar em "Buscar"
        Então o sistema exibirá na listagem conforme "<Resposta do sistema>"
        E atualiza a quantidade de resultado no texto "Foram encontrados xx registros"
        E disponibiliza o botão "Exportar Registros" no final da página
            Exemplos:
            | <CPF>                                              | <Nome> | <Data inicial> | <Data final> | <Resposta do sistema>                                                                    |
            | 'existente na campanha que já acessou o site'      |        |                |              | Lista somente o usuário respectivo a busca conforme data do Último Acesso                |
            | 'existente na campanha não que não acessou o site' |        |                |              | Lista somente o usuário respectivo a busca como NUNCA ACESSOU na coluna Último Acesso    |
            |                                                    | Teste  |                |              | Lista todos os usuários que contém esse nome, com data do Último Acesso ou NUNCA ACESSOU |
            |                                                    |        | 'com acessos'  |              | Lista todos os usuários com data do Último Acesso a partir da data informada no filtro      |
            |                                                    |        |                |'com acessos' | Lista todos os usuários com data do Último Acesso até a data informada no filtro            |
            |                                                    |        | 'data atual'   |              | Lista todos os usuários com data do Último Acesso de HOJE, inclusive com a data de hoje |
            |                                                    |        |                |'data atual'  | Lista todos os usuários com data do Último Acesso ATÉ HOJE, inclusive com a data de hoje |
            |                                                    |        | 'data atual'   |'data atual'  | Lista somente os usuários com data do Último Acesso de HOJE |


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_acessos-filtrar-com-valores-não-existentes.mp4)
    Cenário: Acessos - Filtrar com valores NÃO existentes
        Dado que o admin esta na tela "Relatório de Acessos"
        Quando preencher os filtros "<CPF>", "<Nome>", "<Data inicial>", "<Data final>" com valores inexistentes
        E clicar em "Buscar"
        Então o sistema exibirá na listagem conforme "<Resposta do sistema>"
        E não exibirá o texto informativo de "Foram encontrados xx registros", pois não existe
        E NÃO disponibiliza o botão "Exportar Registros"
        Exemplos:
            | <CPF>                       | <Nome> | <Data inicial> | <Data final>  | <Resposta do sistema>         |
            | 'não existente na campanha' |        |                |               | "Nenhum registro encontrado." |
            |                             | 'xpto' |                |               | "Nenhum registro encontrado." |
            |                             |        | 'data futura'  |               | "Nenhum registro encontrado." |
            |                             |        |                | '01/01/2022'  | "Nenhum registro encontrado." |


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_acessos-paginação-e-transição.mp4)
    Cenário: Acessos - Paginação e transição
        Dado que o admin esta na listagem de "Acessos"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_acessos-exportar-registros.mp4)
    Cenário: Acessos - Exportar Registros
        Dado que o admin esta na tela "Relatório de Acessos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Acessos" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizou buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Acessos" em extensão .xlsx
        E todos os registros existentes na campanha que já acessaram o banking deverão compor o arquivo que deve ser conforme o modelo requerido em escopo


#5 CN
