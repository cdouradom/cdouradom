#language: pt

Funcionalidade: Admin - Relatório de Entrega de Pop Up
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de entrega de pop up
Para visualizar e exportar os registros de visualizações dos usuários na campanha

-----

Critérios de Aceitação:
Relatório será disponibizado após o Pop Up ser visualizado pelo usuário
Acesso através do botão "Relatório de Entrega" localizado na parte inferior direita da tela Listagem de Pop Ups ou através do botão "Ações"
Acesso através do botão "Ações", só poderá trazer na listagem do relatório de entrega, as vizualições referente ao respectivo Pop Up escolhido
Exibir breadcrumb
Exibir os seguintes filtros: "Tela", "ID do Pop Up", "Título", "CPF", "Nome", "Data Inicial das Visualizações", "Data Final das Visualizações" e botão "Buscar"
Exibir um gride/listagem com o seguinte cabeçalho: "Pop Up", "Tela", "Frequência", "Usuário", "Visualizações" e "Confirmação"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultado para busca realizada: "Nenhum registro encontrado."
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Fazer paginação com 20 registros por página
Disponibilizar na parte inferior direita da tela o botão "Gerar Relatório" para download do relatório de entrega de pop ups, conforme listagem exibida, respeitando filtro aplicado e conforme modelo "Relatório de Entrega de Pop Up" na extensão ".xlsx"

---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Relatório de entrega - Layout
        Dado que o admin está na tela de "Listagem de Pop Up"
        Quando acionar o botão "Relatório de Entrega" localizado na parte inferior direita da tela
        Então o sistema redireciona o admin para a tela da listagem de "Relatório de entrega de Pop Up"
        E todos os disparos de todos os Pop Ups visualizados, serão exibidos com os elementos abaixo
            | Breadcrumbs | Com o Caminho para essa tela                                                                                      |
            | Filtros     | "Tela", "ID do Pop Up", "Título", "CPF", "Nome", "Data Inicial das Visualizações", "Data Final das Visualizações" |
            | Botão       | "Buscar" à frente ou abaixo dos filtros                                                                           |
            | Listagem    | "Pop Up", "Tela", "Frequência", "Usuário", "Visualizações", "Confirmação"                                         |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados xx registros"                                                    |
            | Botão       | "Gerar Relatório" na parte inferior direita da tela                                                               |
    
    

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Relatório de entrega - Botão Ações
        Dado que o admin está na tela de "Listagem de Pop Up"
        E acionou o botão "Ações" no Pop Up já visualizado
        Quando acionar a opção "Relatório"
        Então o sistema redireciona o admin para a listagem de "Relatório de entrega de Pop Up"
        E serão exibidos na listagem da tela, todos os disparo para o respectivo "Pop Up"
        E botão "Gerar Relatório"
        E os elementos da tela estarão alinhados corretamente
    

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Relatório de entrega - Busca com dados válidos/existentes
        Dado que o admin esta na listagem de "Relatório de entrega de Pop Up"
        Quando preencher todos, alguns ou um dos filtros "<Tela>", "<ID do Pop Up>", "<Título>", "<CPF>" e "<Nome>" com valores existentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar o valor no texto informativo " Foram encontrados ** registros"
        E exibirá na listagem somente o(s) registro(s) respectivo(s) à busca conforme "<Resultado do sistema>"
        Exemplos:
            | <Tela> | <ID do Pop Up> | <Título> | <CPF>          | <Nome> | Resultado do Sistema                                        |
            | Home   |                |          |                |        | Lista apenas o(s) pop up(s) com vínculo à respectiva tela   |
            |        | 17             |          |                |        | Lista apenas o(s) pop up(s) com vínculo ao respectivo ID    |
            |        |                | Teste    |                |        | Lista apenas o(s) pop up(s) com vínculo à respectivo Título |
            |        |                |          | 024.830.683-91 |        | Lista apenas o(s) pop up(s) com vínculo à respectivo CPF    |
            |        |                |          |                | Tester | Lista apenas o(s) pop up(s) com vínculo à respectivo Nome   |
            | Home   | 17             |          |                |        | Lista apenas o(s) pop up(s) com a respectiva busca          |
            |        | 17             | Teste    |                |        | Lista apenas o(s) pop up(s) com a respectiva busca          |
            |        |                | Teste    | 024.830.683-91 |        | Lista apenas o(s) pop up(s) com a respectiva busca          |
            |        |                |          | 024.830.683-91 | Tester | Lista apenas o(s) pop up(s) com a respectiva busca          |
        #As informações são somente de exemplo, considerar e utilizar os dados existentes no momento do teste   


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Relatório de entrega - Busca com dados inexistente/inválidos
        Dado que o admin está na listagem de "Relatório de entrega de Pop Up"
        Quando preencher todos, alguns ou um dos filtros com valores inexistentes na campanha
        E acionar o botão "Buscar"
        Então o sistema irá atualizar a listagem com a mensagem "Nenhum registro encontrado."



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Relatório de entrega - Gerar Relatório
        Dado que o admin está na listagem de "Relatório de entrega de Pop Up"
        E realizou uma busca que "filtrou" os resultados existentes na campanha
        Quando o admin clicar em "Gerar Relatório" 
        Então o sistema gera e exporta um arquivo na extensão ".xlsx" conforme colunas abaixo
        | ID | Título | Tela | Frequência | Nome | CPF | Data de Confirmação |
        Mas somente os resultados encontrados conforme busca deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
        Quando o admin não realizar buscas
        E acionar o botão "Gerar Relatório" 
        Então o sistema irá fazer o download do arquivo "Relatório de Entrega de Pop Up" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o modelo requerido em escopo
#5 CN