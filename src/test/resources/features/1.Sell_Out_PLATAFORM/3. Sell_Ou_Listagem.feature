#language: pt

Funcionalidade: Listagem de Importação de Vendas
Como usuário administrador ativo da Plataforma
Quero acessar a Listagem de Importação de Vendas
Para acessar o cadastro de novo arquivo e o detalhamento do arquivos importados

    BD 
     SELECT * FROM `file_import` ORDER BY id DESC;
     SELECT * FROM `file_import_form` ORDER BY id DESC;  
    

-----

Critérios de Aceitação:
Acessado através do menu:  Gerencial > Sell Out > Importação
Exibir breadcrumb na Listagem de importações
Disponibilizar um botão "Importar Vendas"
Botão "Importar Vendas" direciona para o cadastro do arquivo de vendas
Disponibilizar na Listagem de importações os filtros: "Nome do arquivo", "Data de Importação de", "Data de Importação até", "Status" e botão "Buscar"
No filtro "Status" listar as seguintes opções:
    1. "Aguardando Processamento"   -- após importação, antes de rodar a cron de processamento
    2. "Aguardando Aprovação"       -- após rodar a cron de processamento para permitir aprovação/reprovação/reprocessamento
    3. "Processando"                -- enquanto roda a cron de processamento
    4. "Falha no Processamento"     -- quando rodou a cron de processamento e deu falha em todas as linhas do arquivo
    5. "Processado"                 -- status final, após processamento e distribuição de pontos 
    6. "Recusado"                    -- após ação dentro de Detalhes
    7. "Aprovado"                    -- após ação dentro de Detalhes
    8. "Falha no Processamento de Distribuição" -- erro na distribuição de pts após aprovação do arquivo #verificar se realmente virá sempre          
Exibir uma listagem com o seguinte cabeçalho: 
    - "Data" do upload do arquivo
    - "Nome do arquivo"
    - "ID" (do arquivo importado)
    - "Importado por" (admin que realizou a importação do arquivo)
    - "Status" (dinâmico)
    - "Detalhes" (botão exibido somente após rodar a cron de processamento)
Botão "Detalhes" é disponibilizado somente aos Status diferentes de "Aguardando Processamento" e "Processando"
Botão "Detalhes" direciona para o detalhamento do arquivo #ID da file_import na url
Listagem tem ordenação decrescente pelo ID do arquivo e Data de importação
Fazer paginação com 20 registros por página na listagem
Exibir texto informativo dos registros exibidos na listagem, sendo dinâmico conforme filtro aplicado: "Foram encontrados xxx registros"
Exibir texto informativo que não existem registros, seja quando não existe nenhum cadastro como quando não existem resultados para a busca realizada: "Nenhum registro encontrado."

---

@manual
@tarefa_#63667
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-acessar-listagem-de-importacao-de-vendas-e-validar-layout.png
    Cenário: Acessar Listagem de Importação de Vendas e Validar layout
        Dado que o admin está logado na Plataforma
        Quando acionar o menu "Gerencial"
        E acionar o menu "Sell Out"
        E acionar o submenu "Importação de Vendas"
        Então o sistema direciona para a listagem de "Importação de Vendas"
        Quando ainda não existem arquivos cadastrados
        Então a listagem fica vazia com a mensagem "Nenhum registro encontrado"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumb | Gerencial / Sell Out / Importação                                                            |
            | Botão      | "Importar Vendas"                                                                            |
            | Filtros    | Nome do Arquivo, Data de/até, status e botão Buscar                                          |
            | Listagem   | conforme cabeçalho: ID, Nome do Arquivo, Data, Importado por, Status e Ações                 |
            | Ações      | com botão "Detalhes" quando status é diferente de "Aguardando Processamento" e "Processando" |


@manual
@tarefa_#63667
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-acessar-listagem-de-importacao-de-vendas-filtrar.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-II.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-III.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-IV.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-V.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-VI.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-VII.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-VIII.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-IX.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-X.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-XI.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-XII.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-XIII.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-XIV.png,assets/A-acessar-listagem-de-importacao-de-vendas-filtrar-XV.png
    Esquema do Cenário: Listagem de Importação de Venda - Filtrar
        Dado que já existem arquivos de vendas cadastrados
        Quando o admin não realizar nenhum busca
        E acionar o botão "Buscar"
        Então todos os arquivos serão exibidos na listagem
        E o total de resultados encontrados serão conforme o total de importações da campanha
        Quando o admin realizar buscas nos campos "<Nome do arquivo>", "<Data de Importação de>", "<Data de Importação até>" e "<Status>"
        E acionar o botão "Buscar"
        Então o sistema realiza a busca nos registros da campanha 
        E atualiza o valor no texto informativo " Foram encontrados xxx registros"
        E retorna na listagem conforme "<Resultado do sistema>"
            Exemplos:
            | <Nome do arquivo> | <Data de Importação de> | <Data de Importação até> | <Status>                               | <Resultado do sistema>                                                                                 |
            | 'existente'       | vazio                   | vazio                    | vazio                                  | Lista somente a(s) importação(ões) que possuam o nome buscado, total e parcial                         |
            | 'não existente'   | vazio                   | vazio                    | vazio                                  | listagem fica vazia com a mensagem "Nenhum registro encontrado"                                        |
            | vazio             | 'existente'             | vazio                    | vazio                                  | Lista somente a(s) importação(ões) que foram importadas a partir da data inicial informada             |
            | vazio             | 'hoje'                  | vazio                    | vazio                                  | Lista somente a(s) importação(ões) que foram importadas a partir da data inicial informada (hoje)      |
            | vazio             | vazio                   | 'existente'              | vazio                                  | Lista somente a(s) importação(ões) que foram importadas até a data informada                           |
            | vazio             | vazio                   | 'hoje'                   | vazio                                  | Lista somente a(s) importação(ões) que foram importadas até a data informada (hoje)                    |
            | vazio             | 'não existente'         | vazio                    | vazio                                  | listagem fica vazia com a mensagem "Nenhum registro encontrado"                                        |
            | vazio             | vazio                   | 'não existente'          | vazio                                  | listagem fica vazia com a mensagem "Nenhum registro encontrado"                                        |
            | vazio             | 'não existente'         | 'não existente'          | vazio                                  | listagem fica vazia com a mensagem "Nenhum registro encontrado"                                        |
            | vazio             | vazio                   | vazio                    | Aguardando Processamento               | Lista somente a(s) importação(ões) que ainda não foram processadas (cron 1)                            |
            | vazio             | vazio                   | vazio                    | Processando                            | Lista somente a(s) importação(ões) que estão sendo processadas neste momento (cron 1)                  |
            | vazio             | vazio                   | vazio                    | Aguardando Aprovação                   | Lista somente a(s) importação(ões) que foram processadas e podem ser Aprovadas                         |
            | vazio             | vazio                   | vazio                    | Aprovado                               | Lista somente a(s) importação(ões) que foram processados e Aprovados                                   |
            | vazio             | vazio                   | vazio                    | Recusado                               | Lista somente a(s) importação(ões) que foram processados e Reprovados                                  |
            | vazio             | vazio                   | vazio                    | Falha no processamento                 | Lista somente a(s) importação(ões) que foram processados e não podem ser aprovadas por erros           |
            | vazio             | vazio                   | vazio                    | Falha no Processamento de Distribuição | Lista somente a(s) importação(ões) que foram aprovados e resultaram em erros na distribuição de pontos |

            #confirmar sobre o status Processado, pois na Canon e na Acer não consta no filtro, mas atualiza na listagem, sendo o status final
            
@manual
@Tarefa_#63667
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-acessar-listagem-de-importacao-de-vendas-paginacao-e-transicao.mp4
    Cenário: Listagem de Importação de Venda - Paginação e transição
        Dado que o admin esta na listagem de "Importação de Vendas"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros

#3 CN        