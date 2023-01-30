#language: pt

Funcionalidade: Distribuição de pontos de sell out - Conferência
    Como administrador da campanha
    Quero conferir as distribuições de pontos conforme parâmetros nas tabelas de pontos de cada perfil
    Para validar as regras necessárias na distribuição do ponto aos usuários de todos os perfis

    BD 
        SELECT * FROM `file_import_status`;
        SELECT * FROM file_import ORDER BY id DESC;
        SELECT * FROM file_import_row ORDER BY id DESC;
        SELECT * FROM `file_import_form` ORDER BY id DESC;
        SELECT * FROM aiwa_sell_out where account_id = 'IDdoUser' ORDER BY id DESC;
        SELECT * FROM point_statement where account_id = 'IDdoUser' ORDER BY id DESC;
    
    Cron's
        1º sellOutProcessAiwa -- os arquivos já precisam ter passado por essa cron que esta na feature anterior
        2º sellOutDistributeAiwa -- rodar após aprovação do arquivo para que ocorra a distribuição de pontos

-----

Critérios de Aceitação:
Cron de distribuição pega somente os arquivos no status "Aprovado"
Somente linhas com sucesso total serão consideradas da aprovação do arquivo
Somente usuários (CPFs) existentes no arquivo recebem pontuação conforme tabela de pontos de seu perfil
A distribuição do ponto é automática após processamento da cron sellOutDistributeAiwa, sendo disponibilizo para o usuário e exibido nos relatórios de pts distribuídos e extrato do banking de forma instantânea
O ponto deverá subir com o seguinte comentário/observação no relatório de pts distribuídos e extrato do banking: "Crédito de pontos referente à venda <nota fiscal> de <data de venda>"
Todos os usuários recebes pontos conforme valor do produto em seu respectivo perfil multiplicado pela quantidade da venda
Quando o valor do produto para o perfil for igual a zero, não se aplica pontuação #neste caso, foi exibido um alerta no processamento do arquivo para a linha desta venda devido ao valor ser zero , mas não impede a aprovação do arquivo

OBS. Importante: as validações de arquivo, tabelas, produtos e demais colunas já serão realizadas nas validações do processamento do arquivo. 
    Sendo assim, nestes CNs a validação é da linha com sucesso, permitindo sua aprovação.


---

@manual
@tarefa_#63796
@manual-result:success
@manual-last-tested:06-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-VII.xlsx,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-VII.mp4,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-VII.png,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-VIII.png,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-IX.png,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-X.png
    Cenário: Aprovação do arquivo e pontuação do Vendedor
        Dado que o admin "Aprovou" um arquivo importado
        Mas o arquivo possui apenas "Vendedor" na(s) linha(s) de sucesso
        Quando a cron de distribuição rodar
        Então o status do arquivo ficará como "Processando"
        Quando a cron finalizar a distribuição
        Então apenas o Vendedor receberá os pontos 
        E o cálculo é a quantidade da venda multiplicada pelo valor do produto 'Vendedor' na tabela de pontuação vigente da Revenda (Rede) na data da venda
            | "Valor Produto Vendedor" | "Quantidade" | "Pontuação Vendedor" |
            | 50                       | 10           | 500,00               |
            | 35                       | 3            | 105,00               |
            | 10.05                    | 5            | 50,25                |
            | 0                        | 7            | 00,00                |
            #valores de exemplos para orientação, se necessário alterar, desde que a evidência atenda aos requisitos do cálculo e pontuações do cenário alterado


@manual
@tarefa_#63796
@ajuste_#66395
@manual-result:success
@manual-last-tested:13-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-E-GERENTE-DIRETO-III.xlsx,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-E-GERENTE-DIRETO-III.mp4,assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-E-GERENTE-DIRETO-III.mp4,assets/A-apenas-uma-linha-todos-perfis-apenas-vendedor-sem-vr-no-produto-Avisou-e-Pontuou-apenas-para-os-demais-perfis.mp4,assets/A-apenas-uma-linha-que-contem-Apenas-Vendedor-e-ele-possui-valor-ZERO-no-produto-Nao-Pontuou.mp4,assets/A-Linha-1-todos-perfis-mas-apenas-Vendedor-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/A-Linha-1-Apenas-Vendedor-e-ele-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO-E-NAO-INFORMADOS-NO-ARQUIVO.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO.mp4
    Cenário: Aprovação do arquivo e pontuações do Vendedor e Gerente Direto
        Dado que o admin "Aprovou" um arquivo importado
        E o arquivo possui as colunas de "Vendedor" e "Gerente Direto" preenchidas na(s) linha(s) de sucesso
        Quando a cron de distribuição rodar
        Então o status do arquivo ficará como "Processando"
        Quando a cron finalizar a distribuição
        Então o "Vendedor" e o "Gerente Direto" receberão pontos conforme suas respectivas tabelas de pontuação da Revenda (Rede) vinculada
        E vigente na data da venda
        E o cálculo é a quantidade da venda multiplicada pelo valor do produto de cada perfil na tabela de pontuação vigente da Revenda (Rede) na data da venda
            | "Valor Produto Vendedor" | "Valor Produto Gerente Direto" | "Quantidade" | "Pontuação Vendedor" | "Pontuação Gerente Direto" |
            | 15                       | 0                              | 10           | 150,00               | 00,00                      |
            | 450                      | 311                            | 3            | 1350,00              | 933                        |
            | 10.05                    | 150,90                         | 5            | 50,25                | 754,50                     |
            | 0                        | 23                             | 7            | 00,00                | 161                        |
            #valores de exemplos para orientação, se necessário alterar, desde que a evidência atenda aos requisitos do cálculo e pontuações do cenário alterado    



@manual
@tarefa_#63796
@ajuste_#66395
@manual-result:success
@manual-last-tested:13-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-E-SUPERVISOR-II.xlsx,assets/A-apenas-uma-linha-todos-perfis-apenas-vendedor-sem-vr-no-produto-Avisou-e-Pontuou-apenas-para-os-demais-perfis.mp4,assets/A-apenas-uma-linha-que-contem-Apenas-Vendedor-e-ele-possui-valor-ZERO-no-produto-Nao-Pontuou.mp4,assets/A-Linha-1-todos-perfis-mas-apenas-Vendedor-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/A-Linha-1-Apenas-Vendedor-e-ele-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO-E-NAO-INFORMADOS-NO-ARQUIVO.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO.mp4
    Cenário: Aprovação do arquivo e pontuações do Vendedor e Supervisor
        Dado que o admin "Aprovou" um arquivo importado
        E o arquivo possui as colunas de "Vendedor" e "Supervisor" preenchidas na(s) linha(s) de sucesso
        Quando a cron de distribuição rodar
        Então o status do arquivo ficará como "Processando"
        Quando a cron finalizar a distribuição
        Então o "Vendedor" e o "Supervisor" receberão pontos conforme suas respectivas tabelas de pontuação da Revenda (Rede) vinculada
        E vigente na data da venda
        E o cálculo é a quantidade da venda multiplicada pelo valor do produto de cada perfil na tabela de pontuação vigente da Revenda (Rede) na data da venda
            | "Valor Produto Vendedor" | "Valor Produto Supervisor" | "Quantidade" | "Pontuação Vendedor" | "Pontuação Supervisor" |
            | 15                       | 0                          | 10           | 150,00               | 00,00                  |
            | 450                      | 311                        | 3            | 1350,00              | 933                    |
            | 10.05                    | 150,90                     | 5            | 50,25                | 754,50                 |
            | 0                        | 23                         | 7            | 00,00                | 161                    |
            #valores de exemplos para orientação, se necessário alterar, desde que a evidência atenda aos requisitos do cálculo e pontuações do cenário alterado
#66395 - Quando vendedor não pontua (vr de ponto = 0 no produto) os demais perfis também deixam de pontuar

@manual
@tarefa_#63796
@ajuste_#66395
@manual-result:success
@manual-last-tested:13-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-E-GERENTE-REGIONAL-I.xlsx,assets/A-apenas-uma-linha-todos-perfis-apenas-vendedor-sem-vr-no-produto-Avisou-e-Pontuou-apenas-para-os-demais-perfis.mp4,assets/A-apenas-uma-linha-que-contem-Apenas-Vendedor-e-ele-possui-valor-ZERO-no-produto-Nao-Pontuou.mp4,assets/A-Linha-1-todos-perfis-mas-apenas-Vendedor-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/A-Linha-1-Apenas-Vendedor-e-ele-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO-E-NAO-INFORMADOS-NO-ARQUIVO.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO.mp4
    Cenário: Aprovação do arquivo e pontuações do Vendedor e Gerente Regional
        Dado que o admin "Aprovou" um arquivo importado
        E o arquivo possui as colunas de "Vendedor" e "Gerente Regional" preenchidas na(s) linha(s) de sucesso
        Quando a cron de distribuição rodar
        Então o status do arquivo ficará como "Processando"
        Quando a cron finalizar a distribuição
        Então o "Vendedor" e o "Gerente Regional" receberão pontos conforme suas respectivas tabelas de pontuação da Revenda (Rede) vinculada
        E vigente na data da venda
        E o cálculo é a quantidade da venda multiplicada pelo valor do produto de cada perfil na tabela de pontuação vigente da Revenda (Rede) na data da venda
            | "Valor Produto Vendedor" | "Valor Produto Gerente Regional" | "Quantidade" | "Pontuação Vendedor" | "Pontuação Gerente Regional" |
            | 15                       | 0                                | 10           | 150,00               | 00,00                        |
            | 450                      | 311                              | 3            | 1350,00              | 933                          |
            | 10.05                    | 150,90                           | 5            | 50,25                | 754,50                       |
            | 0                        | 23                               | 7            | 00,00                | 161                          |
#66395 - Quando vendedor não pontua (vr de ponto = 0 no produto) os demais perfis também deixam de pontuar

@manual
@tarefa_#63796
@ajuste_#66395
@manual-result:success
@manual-last-tested:13-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-APENAS-VENDEDOR-GERENTE-DIRETO-E-GERENTE-REGIONAL-I.xlsx
    Cenário: Aprovação do arquivo e pontuações do Vendedor, Gerente Direto e Gerente Regional
        Dado que o admin "Aprovou" um arquivo importado
        E o arquivo possui as colunas de "Vendedor", "Gerente Direto" e "Gerente Regional" na(s) linha(s) de sucesso
        Quando a cron de distribuição rodar
        Então o status do arquivo ficará como "Processando"
        Quando a cron finalizar a distribuição
        Então o "Vendedor", "Gerente Direto" e "Gerente Regional" receberão suas respectivas tabelas de pontuação vigente da Revenda (Rede) na data da venda 
        E vigente na data da venda
        E o cálculo é a quantidade da venda multiplicada pelo valor do produto de cada perfil na tabela de pontuação vigente da Revenda (Rede) na data da venda
            | "Valor Produto Vendedor" | "Valor Produto Gerente Direto" | "Valor Produto Gerente Regional" | "Quantidade" | "Pontuação Vendedor" | "Pontuação Gerente Direto" | "Pontuação Gerente Regional" |
            | 15                       | 0                              | 0,05                             | 10           | 150,00               | 00,00                      | 00,50                        |
            | 450                      | 311                            | 115                              | 3            | 1350,00              | 933,00                     | 345,00                       |
            | 10.05                    | 150,90                         | 99,99                            | 5            | 50,25                | 754,50                     | 499,95                       |
            | 0                        | 23                             | 0                                | 7            | 00,00                | 161,00                     | 00,00                        |
            #valores de exemplos para orientação, se necessário alterar, desde que a evidência atenda aos requisitos do cálculo e pontuações do cenário alterado
#66395 - Quando vendedor não pontua (vr de ponto = 0 no produto) os demais perfis também deixam de pontuar

@manual
@tarefa_#63796
@ajuste_#66395
@manual-result:success
@manual-last-tested:13-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-APROVAR-E-DISTRIBUIR-TODOS-OS-PERFIS-I.xlsx,assets/A-apenas-uma-linha-todos-perfis-apenas-vendedor-sem-vr-no-produto-Avisou-e-Pontuou-apenas-para-os-demais-perfis.mp4,assets/A-apenas-uma-linha-que-contem-Apenas-Vendedor-e-ele-possui-valor-ZERO-no-produto-Nao-Pontuou.mp4,assets/A-Linha-1-todos-perfis-mas-apenas-Vendedor-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/A-Linha-1-Apenas-Vendedor-e-ele-com-vr-zero--Linha-2-todos-perfis-com-vr-para-todos.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO-E-NAO-INFORMADOS-NO-ARQUIVO.mp4,assets/GERENTE-DIRETO--SUPERVISOR--GERENTE-REGIONAL--SEM-PONTUACAO-NO-PRODUTO.mp4
    Cenário: Aprovação do arquivo e pontuações para todos os perfis
        Dado que o admin "Aprovou" um arquivo importado
        E o arquivo possui as colunas de "Vendedor", "Gerente Direto", "Líder de Loja" e "Gerente Regional" na(s) linha(s) de sucesso
        Quando a cron de distribuição rodar
        Então o status do arquivo ficará como "Processando"
        Quando a cron finalizar a distribuição
        Então todos os usuários receberão suas respectivas tabelas de pontuação vigente da Revenda (Rede) na data da venda 
        E vigente na data da venda
        E o cálculo é a quantidade da venda multiplicada pelo valor do produto de cada perfil na tabela de pontuação vigente da Revenda (Rede) na data da venda
            | "Valor Produto Vendedor" | "Valor Produto Gerente Direto" | "Valor Produto Supervisor" | "Valor Produto Gerente Regional" | "Quantidade" | "Pontuação Vendedor" | "Pontuação Gerente Direto" | "Pontuação Supervisor" | "Pontuação Gerente Regional" |
            | 15                       | 0                              | 0                          | 0,05                             | 10           | 150,00               | 00,00                      | 00,00                  | 00,50                        |
            | 450                      | 311                            | 220                        | 115                              | 3            | 1350,00              | 933,00                     | 660,00                 | 345,00                       |
            | 10.05                    | 150,90                         | 75                         | 99,99                            | 5            | 50,25                | 754,50                     | 375,00                 | 499,95                       |
            | 0                        | 23                             | 0,99                       | 0                                | 7            | 00,00                | 161,00                     | 6,93                   | 00,00                        |
            #valores de exemplos para orientação, se necessário alterar, desde que a evidência atenda aos requisitos do cálculo e pontuações do cenário alterado
#66395 - Quando vendedor não pontua (vr de ponto = 0 no produto) os demais perfis também deixam de pontuar

@manual
@tarefa_#63796
@manual-result:success
@manual-last-tested:12-12-2022
@manual-test-evidence:assets/A-teste-vigencia-D-menos-um-II.xlsx,assets/A-teste-vigencia-D-menos-um-II.mp4,assets/A-teste-vigencia-D-menos-um-II.png
    Cenário: Atribuição de pontos com tabelas de vigências diferentes
    Dado que existem duas tabelas de pontos para a Rede:
            | <Tabela de Pontos> | <Vigência - Início> | <Vigência - Término> | <Produto> | <Valor Produto Vendedor> | <Valor Produto Gerente Direto> | <Valor Produto Supervisor> | <Valor Produto Gerente Regional> |
            | Tabela 1           | 01-01-2022          | 21-11-2022           | Produto X | 10.00                    | 20.00                          | 30.00                      | 40.00                            |
            | Tabela 2           | 22-11-2022          | 23-11-2022           | Produto X | 50.00                    | 60.00                          | 70.00                      | 80.00                            |
            #valores de exemplos para orientação, se necessário alterar, desde que a evidência atenda aos requisitos do cálculo e pontuações do cenário alterado
    E admin "Aprovou" um arquivo importado com data da venda em "22-11-2022" com as colunas de "Vendedor", "Gerente Direto", "Líder de Loja" e "Gerente Regional" na(s) linha(s) de sucesso e com os seguintes valores: 
            | <Produto> | <Quantidade> |
            | Produto X | 1            |
    Quando a cron de distribuição rodar
    Então o status do arquivo ficará como "Processando"
    Quando a cron finalizar a distribuição
    Então todos os usuários receberão as seguintes pontuações, de acordo com a tabela vigente:
            | "Pontuação Vendedor" | "Pontuação Gerente Direto" | "Pontuação Supervisor" | "Pontuação Gerente Regional" |
            | 50,00                | 60,00                      | 70,00                  | 80,00                        |

#7 CN           