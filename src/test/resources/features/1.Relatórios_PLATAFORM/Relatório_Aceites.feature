#language: pt

Funcionalidade: Admin - Relatório de Aceites de Termos
    Como usuário administrador ativo na Plataforma
    Quero acessar o relatório de aceites
    Para visualizar e exportar os registros de aceites dos usuários na campanha

    -----

    Critérios de Aceitação:
    Exibir breadcrumb
    Exibir os seguintes filtros: "CPF", "Nome", "Data inicial", "Data final" e botão "Buscar"
    Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
    Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado par a busca realizada: "Nenhum registro encontrado."
    Exibir um gride/listagem com o seguinte cabeçalho: "CPF", "Nome" e "Data"
    Fazer paginação com 20 registros por página
    Disponibilizar no parte inferior direita da tela o botão "Exportar Registros" para download do relatório de aceites, "apenas quando existem registros listados"
    "Exportar Registros" conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Aceites" na extensão ".xlsx"


    ---

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_aceites-de-termos-acessar-e-layout.mp4)
    Cenário: Aceites de Termos - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Aceites de Termos" será exibido dentre as opções
        Quando o admin clicar no submenu "Aceites de Termos"
        Então o sistema rediciona para a tela da listagem de "Relatório de Aceites de Termos"
        Quando o sistema redirecionar o admin para a tela das Aceites de Termos
        Então os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                                    |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados xx registros"                  |
            | Filtros     | "CPF", "Nome", "Data inicial", "Data final"                                     |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                                         |
            | Listagem    | "CPF" com máscara, "Nome" completo do usuário e "Data" com data e hora do aceite|
            | Botão       | "Exportar Registros" na parte inferior direita da tela                          |


@manual
@Tarefa_#60473
@Sugestão_#60853
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_acessos-filtrar-com-valores-existentes-v2.mp4)
    Cenário: Aceites de Termos - Filtrar com valores existentes
        Dado que o admin esta na tela "Relatório de Aceites de Termos"
        Quando preencher os filtros "<CPF>", "<Nome>", "<Data inicial>", "<Data final>" com valores existentes
        E clicar em "Buscar"
        Então o sistema exibirá na listagem conforme "<Resposta do sistema>"
        E atualiza a quantidade de resultado no texto "Foram encontrados xx registros"
        E disponibiliza o botão "Exportar Registros" no final da página
            Exemplos:
            | <CPF>                                       | <Nome> | <Data inicial> | <Data final>  | <Resposta do sistema>                                                             |
            | 'existente na campanha que já aceitou'      |        |                |               | Lista somente o usuário respectivo a busca com data do aceite                     |
            | 'existente na campanha mas que não aceitou' |        |                |               | "Nenhum registro encontrado."                                                     |
            |                                             | Teste  |                |               | Lista todos os usuários que contém esse nome e já aceitaram o regulamento         |
            |                                             |        | 'com aceites'  |               | Lista todos os usuários com data de Aceite a partir da data informada no filtro   |
            |                                             |        |                | 'com aceites' | Lista todos os usuários com data de Aceite até a data informada no filtro         |
            |                                             |        | 'data atual'   |               | Lista todos os usuários com data de Aceite de HOJE, inclusive com a data de hoje  |
            |                                             |        |                | 'data atual'  | Lista todos os usuários com data de Aceite ATÉ HOJE, inclusive com a data de hoje |
            |                                             |        | 'data atual'   | 'data atual'  | Lista somente os usuários com data de Aceitede HOJE                               |
    #fazer aceite e validar se está registrando e exibindo na tela

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_aceites-de-termos-filtrar-com-valores-não-existentes.mp4)
    Cenário: Aceites de Termos - Filtrar com valores NÃO existentes
        Dado que o admin esta na tela "Relatório de Aceites de Termos"
        Quando preencher os filtros "<CPF>", "<Nome>", "<Data inicial>", "<Data final>" com valores enexistentes
        E clicar em "Buscar"
        Então o sistema exibirá na listagem conforme "<Resposta do sistema>"
        E não exibirá o texto informativo de "Foram encontrados xx registros", pois não existe
        E NÃO disponibiliza o botão "Exportar Registros"
        Exemplos:
            | <CPF>                       | <Nome> | <Data inicial> | <Data final>               | <Resposta do sistema>         |
            | 'não existente na campanha' |        |                |                            | "Nenhum registro encontrado." |
            |                             | 'xpto' |                |                            | "Nenhum registro encontrado." |
            |                             |        | 'data futura'  |                            | "Nenhum registro encontrado." |
            |                             |        |                | 'antes do primeiro aceite' | "Nenhum registro encontrado." |


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_aceites-de-termos-paginação-e-transição.mp4)
    Cenário: Aceites de Termos - Paginação e transição
        Dado que o admin esta na listagem de "Aceites de Termos"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:04-10-2022
    @manual-test-evidence:[Evidência](assets/A_aceites-de-termos-exportar-registros.mp4)
    Cenário: Aceites de Termos - Exportar Registros
        Dado que o admin esta na tela "Relatório de Aceites de Termos"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Aceites de Termos" em extensão .xlsx
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Exportar Registros"
        Então o sistema irá fazer o download do arquivo "Relatório de Aceites de Termos" em extensão .xlsx
        E todos os registros existentes na campanha que já deram aceite deverão compor o arquivo que deve ser conforme o modelo requerido em escopo


#5 CN
