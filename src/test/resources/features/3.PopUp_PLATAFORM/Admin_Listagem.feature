#language: pt

Funcionalidade: Admin - Listagem de Pop Ups
Como usuário administrador ativo na Plataforma
Quero visualizar os pop ups existentes
Para realizar buscas, ações e exportar os registros

-----

Critérios de Aceitação:
Exibir breadcrumb
Exibir os seguintes filtros: "Título", "Tela", "Data Inicial", "Data Final", "Status" e botão "Buscar"
Listar no select "Status": 'Ativo' e 'Inativo'
Exibir na parte superior direita da tela os botões "Ordenar Pop Up" e "Cadastrar" 
Exibir um gride/listagem com o seguinte cabeçalho: "Título", "Período", "Tela", "Frequência", "Situação", "Status" e botão "Ações"
Exibir na listagem os dados conforme cabeçalho
Exibir dentro de "Ações" as opções "Visualizar", "Editar" "Relatório" e "Inativar"
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultados para a busca realizada: "Nenhum registro encontrado."
Fazer paginação com 20 registros por página
Disponibilizar na parte inferior direita da tela o botão "Relatório de Entrega" para download do relatório de entrega de Pop Up, conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Entrega de Pop Up" na extensão ".xlsx"

-----

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
   Cenário: Pop Ups - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu principal "Gerencial"
        E acionar o menu "Pop Up"
        Então o sistema rediciona para a tela da listagem de "Pop Ups"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Pop Ups - Busca com dados válidos/existentes
        Dado que o admin esta na listagem de "Pop Ups"
        Quando preencher todos, alguns ou um dos filtros "<Título>", "<Tela>", "<Data Inicial>", "<Data Final>" e "<Status>" com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados ** registros"
        E exibirá na listagem somente o(s) registro(s) respectivo(s) à busca conforme "<Resultado do sistema>"
        Exemplos:
            | <Título> | <Tela> | <Data Inicial>   | <Data Final>     | <Status> | Resultado do Sistema                                           |
            | Teste    |        |                  |                  |          | Lista apenas o(s) pop up(s) com a respectiva busca             |
            |          | Home   |                  |                  |          | Lista apenas o(s) pop up(s) com vínculo à respectiva tela      |
            |          |        | 30/12/2022 00:00 |                  |          | Lista apenas o(s) pop up(s) com vínculo à respectiva data/hora |
            |          |        |                  | 30/12/2022 00:00 |          | Lista apenas o(s) pop up(s) com vínculo à respectiva data/hora |
            |          |        | 30/12/2022 00:00 | 06/01/2023 00:00 |          | Lista apenas o(s) pop up(s) com vínculo ao respectivo período  |
            |          |        |                  |                  | Ativo    | Lista apenas o(s) pop up(s) Ativo(s)                           |
            |          |        |                  |                  | Inativo  | Lista apenas o(s) pop up(s) Inativo(s)                         |
            #As informações são somente de exemplo, considerar e utilizar os dados existentes no momento do teste     


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Ups - Busca com dados inexistente/inválidos
        Dado que o admin esta na listagem de "Pop Ups"
        Quando preencher todos, alguns ou um dos filtros com valores inexistentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar a listagem com a mensagem "Nenhum registro encontrado."


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Ups - Relatório de Entrega
        Dado que o admin esta na listagem de "Pop Ups"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando acionar o botão "Relatório de Entrega"
        Então o sistema irá fazer o download do arquivo "Relatório de Entrega de Pop Ups" em extensão ".xlsx"
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo
        E deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Relatório de Entrega"
        Então o sistema irá fazer o download do arquivo "Relatório de Entrega de Pop Ups" em extensão ".xlsx"
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo 
        

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Ups - Ações e submenus
        Dado que o admin esta na listagem de "Pop Ups"
        Quando acionar a opção "Ações" em algum pop up exibido na listagem
        Então o sistema exibirá apenas as opções "Visualizar", "Editar" "Relatório" e "Inativar"
        Quando o admin clicar em "Visualizar"
        Então o sistema abre o modal do pop up como é visualizado no banking
        Quando o admin cliar em "Editar"  
        Então o sistema redireciona para tela de cadastro deste pop up
        Quando o admin cliar em "Relatório"  
        Então o sistema redireciona para o relatório de entrega filtrando por esse pop up listando todas as respectivas visualizações
        Quando o admin cliar em "Inativar"  
        Então o sistema inativa o respectivo pop up
        #Os pop ups que ainda não foram visualizados, a opção Relatório não aparece


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pop Ups - Paginação e transição
        Dado que o admin esta na listagem de "Pop Ups"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros

#6 CN