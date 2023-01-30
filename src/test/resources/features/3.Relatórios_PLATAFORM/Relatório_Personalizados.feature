#language: pt

Funcionalidade: Admin - Relatório Personalizado
Como usuário administrador ativo na Plataforma
Quero acessar o relatório de Relatório Personalizado
Esse relatório é utilizado para que o admin consigar ter acesso a relatórios que não são "padrões" 
É necessário que o relatório seja cadastrado no banco de dados para que o mesmo seja exibido 
Esse relatório nada mais é que uma consulta de SQL cadastrada  na tabela 'saved _eport' 
    campo "campaign_id" é o id da account da campanha 
    campo "title" é o nome do relatório cadastrado e que será exibido 
    campo "query" é comando SQL que será executado pra gerar o relatório
    campo "tags" são os filtros que podem ter para realizar o campo do campo "query"

    -----

Critérios de Aceitação:
Para aparecer algum relatório nessa tela é necessário que tenha algum relatório cadastrado na tabela `saved_report`
SELECT * FROM `saved_report` where campaign_id = ;
Exibir breadcrumb

    ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Relatório Personalizado - Acessar e Layout
        Dado que o admin esta logado
        Quando acessar o menu "Relatório"
        Então o submenu "Relatório Personalizado" será exibido dentre as opções
        Quando o admin clicar no submenu "Relatório Personalizados"
        Então o sistema rediciona para a tela da listagem de "Relatório Personalizado"
        E os elementos abaixo serão exibidos
            | Breadcrumbs | Com o Caminho para essa tela                                   |
            | Resultados  | Texto informativo e dinâmico: "Foram encontrados xx registros" |
            | Listagem    | "Titulo" e "Data de Cadastro"                                  |
            | Botão       | "Gerar" na lateral direta de cada linha da listagem            |
 


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Relatório Personalizado - Listagem e Paginação
        Dado que o admin acessou a tela de "Relatório Personalizados"
        Quando não existem registros na campanha
        Então manter listagem vazia com texto padrão "Nenhum resultado encontrado"
        Quando existem
        E a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        E a ordenação ocorre de forma crescente
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros4



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pontos Distribuídos - Exportar Registros sem configuração 
        Dado que o admin acessou a tela de "Relatório Personalizados"
        Quando acionar o botão "Gerar"
        Então o sistema irá apresentar um modal com dois botões sendo "Cancelar" e "Salvar"
        Quando o admin clicar em "Cancelar" 
        Então o sistema vai fechar o modal 
        Quando o admin clicar em "Salvar"
        Então o sistema faz o download do arquivo "Nome do arquivo cadastrado" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o SQL cadastrado 



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pontos Distribuídos - Exportar Registros sem preencher campos complementares 
        Dado que o admin acessou a tela de "Relatório Personalizados"
        Quando acionar o botão "Gerar"
        Então o sistema irá apresentar um modal com dois botões sendo "Cancelar", "Salvar" e alguns filtros 
            | Data Inicio |
            | Data Fim    | 
        Quando o admin clicar em "Salvar" sem informar os campos complementates ou com valores invalidos 
        Então o sistema apresenta a mensagem "<Mensagem do Sistema>"
            Exemplos:
            | Data Inicio | Data Fim   | Mensagem                  |
            |             |            | Preencha este campo       |
            |             | 02/02/2023 | Preencha este campo       |
            | 02/02/2023  |            | Preencha este campo       |
            | 31/02/2023  | 02/02/2023 | Introduza um valor valido |
            | 02/02/2023  | 31/02/2023 | Introduza um valor valido |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Pontos Distribuídos - Exportar Registros preenchendo campos complementares 
        Dado que o admin acessou a tela de "Relatório Personalizados"
        Quando acionar o botão "Gerar"
        Então o sistema irá apresentar um modal com dois botões sendo "Cancelar", "Salvar" e alguns filtros
        Quando o admin preencher os campos necessário de forma correta 
        E clicar no botão "Salvar"
        Então o sistema faz o download do arquivo "Nome do arquivo cadastrado" em extensão .xlsx
        E todos os registros existentes na campanha deverão compor o arquivo que deve ser conforme o SQL cadastrado 
            | Data Inicio | Data Fim   | 
            | 02/02/2023  | 02/02/2023 | 


#5 CN
