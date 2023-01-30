#language: pt

Funcionalidade: Tela de detalhes do sell out
    Como administrador da campanha
    Quero acessar os detalhes das importações
    Para validar as informações do processamento, fazer extrações, aprovação ou reprovação, e até reprocessar o arquivo

        BD 
        SELECT * FROM `file_import_status`;
        SELECT * FROM `file_import` where account_id = 'IDdaCampanha' ORDER BY id DESC;
        SELECT * FROM `aiwa_sell_out` ORDER BY id DESC;

    Cron's
        1º sellOutProcessFischer -- os arquivos já precisam ter passado por essa cron que esta na feature anterior
        2º sellOutDistributeFischer -- cron precisa ser acionada após aprovação de arquivos para calcular a distribução de pts

-----

Critérios de Aceitação:
Tela de "Detalhes" contém as seções: "Seção Arquivo", "Seção Pendências" e os "Botões de ações" no final da tela
Seção Arquivo é composta das seguintes informações: 
    -- "Data do arquivo", "Nome do arquivo", 
    -- "Quantidade de linhas" do arquivo sem contar o cabeçalho, "Quantidade de linhas com sucesso", "Quantidade de Pendências" linhas com críticas, 
    -- "Status", "Data da aprovação" ou reprovação, "Usuário" admin que aprovou ou reprovou o arquivo e "Motivo" quando o status é recusado
Os campos "Data da aprovação" e "Usuário" são preenchidos somente após a Aprovação ou Reprovação do arquivo
O campo "Motivo" é preenchido somente com a Reprovação do arquivo
Seção Pendências é apresentada somente se houverem críticas (erros/alertas) no processamento das linhas do arquivo
Seção Pendências é composta da seguinte estrutura: "Linha" Nº da linha no arquivo com erro/crítica, "Coluna" nome do campo com erro/crítica, "Valor" informação do campo com erro/crítica, e "Crítica" sendo o Erro/Observação: Mensagem de crítica conforme validações das regras no processamento do arquivo
Os botões desta tela são: "Aprovar", "Reprovar", "Reprocessar", "Exportar erros", "Exportar original" e "Voltar"
Botão Voltar apenas retorna par a listagem de Importações #não é impeditiva e não tem em outras campanhas, mas pode ser inserida como sugestão caso seja entregue para teste sem
Botão Aprovar disponível apenas quando o status do arquivo é "Aguardando aprovação", ou seja, contendo linhas no campo "Quantidade de linhas com sucesso" 
Botão Reprovar disponível apenas quando o status do arquivo é "Aguardando aprovação", ou seja, contendo linhas na "Quantidade de linhas com sucesso"
Botão Reprocessar disponível para os status "Falha no processamento" e "Aguardando Aprovação", mas desabilitado nos status "Aprovado", "Reprovado", "Falha no Processamento de Distribuição" e "Processado"
Botão Exportar erros disponível apenas quando houver pendências listadas, sendo erro/crítica
Botão Exportar erros baixa o arquivo modelo com uma coluna adicional das pendências exibidas em tela por linha
Botão Exportar original disponivel sempre nas importações via admin
Botão Exportar original baixa o arquivo cadastrado 
Ao clicar em "Aprovar" um modal para preechimento da senha é exibido
Ao aprovar um arquivo com pendências, somente as linhas com sucesso são importadas e registradas na tabela de sell out da campanha em BD
Ao aprovar um arquivo sem pendências, então todas as linhas são importadas e registradas na tabela de sell out da campanha em BD
Ao clicar em "Reprovar" um modal para preechimento do motivo e da senha é exibido, e ambas são obrigatórios
Ao reprovar um arquivo, seja com pendências ou não, então nenhuma linha é importadas
Seja na aprovação ou reprovação, a senha do admin é validada para efetivar a ação

---

@manual
@tarefa_#63791
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-aprovar-arquivo-com-pendencias.mp4
    Cenário: Aprovar Arquivo com pendências
        Dado que o admin acionou o botão "Detalhes" de uma importação com status "Aguardando Aprovação"
        E esta importação possui críticas na listagem de "Pendências"
        Mas tbm possui linhas com sucesso
        Quando o admin acionar o botão "Aprovar"
        Então um modal será apresentado para preenchimento e confirmação da senha do admin que está fazendo a aprovação
            | Informe sua senha | Campo opentext para inserir a senha |
            | Botões            | "Cancelar" e "Aprovar"              |
        Quando o admin acionar o botão "Cancelar"
        Então o modal se fecha e a importação permanecerá com status "Aguardando Aprovação"
        Quando o admin acionar o botão "Aprovar"
        Mas não preencher sua senha
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório no campo "A senha é obrigatória"
        Quando o admin preencher com senha errada
        E acionar o botão "Aprovar"
        Então o sistema irá exibir um alerta de que a senha está incorreta
        Quando o admin preencher com sua senha corretamente
        E acionar o botão "Aprovar"
        Então o sistema registra apenas as linhas das vendas com sucesso na tabela 'aiwa_sell_out' conforme as informações abaixo #confirmar nome da tabela e atualizar aqui caso seja diferente, no momento desta escrita a tabela ainda não existia
            | "id"        | "account_id"   | "supervisor_id"  | "direct_manager_id"  | "regional_manager_id"  | "resale_id"   | "network_id" | "product_id"  | "quantity"          | "sale_date"   | "invoice_number" | "invoice_key" | "point_statement_seller_id" | "point_statement_supervisor_id" | "point_statement_direct_manager_id" | "point_statement_regional_manager_id" | "created_at"     |
            | incremental | id do vendedor | id do supervisor | id do gerente direto | id do gerente regional | id da revenda | id da rede   | id do produto | quantidade da venda | data da venda | número da nota   | chave da nota | pts vendedor                | pts supervisor                  | pts gerente direto                  | pts gerente regional                  | data do registro |
        E altera o status desta importação para "Aprovado"
        E grava o usuário admin e a data de aprovação nos campos correspondentes "Data da aprovação" e "Usuário"
        E redireciona para a listagem de importações
        E exibe um modal de sucesso com a mensagem "O arquivo foi aprovado com sucesso!"
#OBS: Na evidência é possível ver a ausência da chave da nota no BD. Esta situação já foi reportada no card de ajuste #65297

@manual
@tarefa_#63791
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-aprovar-arquivo-SEM-pendencias.mp4,assets/A-aprovar-arquivo-COM-e-SEM-pendencias.png
    Cenário: Aprovar Arquivo sem pendências
        Dado que o admin acionou o botão "Detalhes" de uma importação com status "Aguardando Aprovação"
        E esta importação não possui críticas na listagem de "Pendências", pois todas as linhas resultaram com sucesso no processamento
        Quando o admin acionar o botão "Aprovar"
        Então um modal será apresentado para preenchimento e confirmação da senha do admin que está fazendo a aprovação
            | Informe sua senha | Campo opentext para inserir a senha |
            | Botões            | "Aprovar" e "Cancelar"              |
        Quando o admin acionar o botão "Cancelar"
        Então o modal se fecha e a importação permanecerá com status "Aguardando Aprovação"
        Quando o admin acionar o botão "Aprovar"
        Mas não preencher sua senha
        Então o sistema irá exibir mensagem de preenchimento obrigatório no campo "Informe sua senha"
        Quando o admin preencher com senha errada
        E acionar o botão "Aprovar"
        Então o sistema irá exibir alerta de que a senha está incorreta
        Quando o admin preencher com sua senha corretamente
        E acionar o botão "Aprovar"
        Então o sistema registra todas as linhas de vendas do arquivo na tabela 'aiwa_sell_out' conforme as informações abaixo #confirmar nome da tabela e atualizar aqui caso seja diferente, no momento desta escrita a tabela ainda não existia
            | "id"        | "account_id"   | "supervisor_id"  | "direct_manager_id"  | "regional_manager_id"  | "resale_id"   | "network_id" | "product_id"  | "quantity"          | "sale_date"   | "invoice_number" | "invoice_key" | "point_statement_seller_id" | "point_statement_supervisor_id" | "point_statement_direct_manager_id" | "point_statement_regional_manager_id" | "created_at"     |
            | incremental | id do vendedor | id do supervisor | id do gerente direto | id do gerente regional | id da revenda | id da rede   | id do produto | quantidade da venda | data da venda | número da nota   | chave da nota | pts vendedor                | pts supervisor                  | pts gerente direto                  | pts gerente regional                  | data do registro | 
        E altera o status desta importação para "Aprovado"
        E grava o usuário admin e a data de aprovação nos campos correspondentes "Data da aprovação" e "Usuário"
        E redireciona para a listagem de importações
        E exibe um modal de sucesso com a mensagem "O arquivo foi aprovado com sucesso!"
#OBS: Na evidência é possível ver a ausência da chave da nota no BD. Esta situação já foi reportada no card de ajuste #65297


@manual
@tarefa_#63793
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-reprovar-arquivo-com-pendencias.mp4,assets/A-reprovar-arquivo-com-pendencias.png
    Cenário: Reprovar Arquivo com pendências
        Dado que o admin acionou o botão "Detalhes" de uma importação com status "Aguardando Aprovação"
        E esta importação possui críticas na listagem de "Pendências"
        Mas tbm possui linhas com sucesso
            Quando o admin acionar o botão "Reprovar"
        Então um modal será apresentado para preenchimento de motivo da reprova
        E confirmação da senha do admin que está fazendo a reprovação
            | "Motivo"            | Campo opentext para inserir o motivo da reprova |
            | "Informe sua senha" | Campo opentext para inserir a senha             |
            | "Botões"            | "Aprovar" e "Cancelar"                          |
            Quando o admin acionar o botão "Cancelar"
        Então o modal se fecha e a importação permanecerá com status "Aguardando Aprovação"
        Quando o admin acionar o botão "Reprovar"
        Mas não preencher os campos motivo e senha
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório nos campos "Motivo" e "Informe sua senha"
            Quando o admin acionar o botão "Reprovar"
        Mas preencher somente o motivo
        E não preencher a senha
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório no campo "Informe sua senha"
            Quando o admin acionar o botão "Reprovar"
        Mas preencher somente a senha
        E não preencher o motivo
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório no campo "Motivo"
            Quando o admin preencher com senha errada
        E acionar o botão "Reprovar"
        Então o sistema irá exibir um alerta de que a senha está incorreta
            Quando o admin preencher com sua senha corretamente
        E informar um motivo
        E acionar o botão "Reprovar"
        Então o sistema altera o status desta importação para "Reprovado"
        E grava o motivo, o usuário admin e a data de reprovação nos campos correspondentes "Data da aprovação", "Usuário" e "Motivo"
        E redireciona para a listagem de importações
        E exibe um modal de sucesso com a mensagem "O arquivo foi reprovado com sucesso!"
        Mas não registra nenhuma linha de vendas na tabela 'aiwa_sell_out'   #confirmar nome da tabela e atualizar aqui caso seja diferente, no momento desta escrita a tabela ainda não existia


@manual
@tarefa_#63793
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-reprovar-arquivo-SEM-pendencias.mp4
    Cenário: Reprovar Arquivo sem pendências
        Dado que o admin acionou o botão "Detalhes" de uma importação com status "Aguardando Aprovação"
        E esta importação não possui críticas na listagem de "Pendências", pois todas as linhas resultaram com sucesso no processamento
            Quando o admin acionar o botão "Reprovar"
        Então um modal será apresentado para preenchimento de motivo da reprova
        E confirmação da senha do admin que está fazendo a reprovação
            | "Motivo"            | Campo opentext para inserir o motivo da reprova |
            | "Informe sua senha" | Campo opentext para inserir a senha             |
            | "Botões"            | "Aprovar" e "Cancelar"                          |
            Quando o admin acionar o botão "Cancelar"
        Então o modal se fecha e a importação permanecerá com status "Aguardando Aprovação"
            Quando o admin acionar o botão "Reprovar"
        Mas não preencher os campos motivo e senha
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório nos campos "Motivo" e "Informe sua senha"
            Quando o admin acionar o botão "Reprovar"
        Mas preencher somente o motivo
        E não preencher a senha
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório no campo "Informe sua senha"
            Quando o admin acionar o botão "Reprovar"
        Mas preencher somente a senha
        E não preencher o motivo
        Então o sistema irá exibir uma mensagem de preenchimento obrigatório no campo "Motivo"
            Quando o admin preencher com senha errada
        E acionar o botão "Reprovar"
        Então o sistema irá exibir um alerta de que a senha está incorreta
            Quando o admin preencher com sua senha corretamente
        E informar um motivo
        E acionar o botão "Reprovar"
        Então o sistema altera o status desta importação para "Reprovado"
        E grava o motivo, o usuário admin e a data de reprovação nos campos correspondentes "Data da aprovação", "Usuário" e "Motivo"
        E redireciona para a listagem de importações
        E exibe um modal de sucesso com a mensagem "O arquivo foi reprovado com sucesso!"
        Mas não registra nenhuma linha de vendas na tabela 'aiwa_sell_out'   #confirmar nome da tabela e atualizar aqui caso seja diferente, no momento desta escrita a tabela ainda não existia


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:[Evidência] #print
    Cenário: Acessar Detalhes de Importação com status Falha no processamento
        Dado que foi importado um arquivo de vendas
        Quando todas a(s) linha(s) deste arquivo importado apresentar erro(s)/crítica(s) após o processamento da 1º cron, seja em uma única coluna ou mais da(s) linha(s)
        Então o status deste arquivo será "Falha no processamento", tanto na listagem como dentro de Detalhes
        Quando o admin visualizar todos os elementos da tela de "Detalhes"
        E as críticas estiverem exibidas na seção "Pendências"
        E apenas os botões "Aprovar" e "Reprovar" estiverem bloqueados
        Então os elementos da tela estão alinhados corretamente

@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-aguardando-aprovacao-sem-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Aguardando Aprovação sem pendências
        Dado que foi importado um arquivo de vendas
        Quando todas as linhas do arquivo importado resultarem em sucesso após o processamento da 1º cron
        Então o status deste arquivo será "Aguardando Aprovação", tanto na listagem como dentro de Detalhes
        Quando o admin visualizar todos os elementos da tela de "Detalhes"
        E não houver listagem na seção "Pendências"
        E os botões "Aprovar", "Reprovar", "Reprocessar" e "Exportar Original" estiverem disponíveis
        Mas o botão "Exportar Erros" estiver bloqueado
        Então os elementos da tela estão alinhados corretamente        


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-aguardando-aprovacao-com-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Aguardando Aprovação com pendências
        Dado que foi importado um arquivo de vendas
        Quando após o processamento da 1º cron houverem linhas com sucesso
        E tbm linhas com erro(s)/crítica(s) 
        Então o status deste arquivo será "Aguardando Aprovação", tanto na listagem como dentro de Detalhes
        Quando o admin visualizar todos os elementos da tela de "Detalhes"
        E houverem críticas na seção "Pendências"
        Mas também houverem linha com sucesso
        E todos os botões "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e "Exportar Original" estiverem disponíveis
        Então os elementos da tela estão alinhados corretamente  


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-aprovado-com-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Aprovado com pendências
        Dado que o admin aprovou um arquivo com linhas de sucesso e linhas de pendências
        E acionou o botão "Detalhes" desta importação
        Quando visualizar todos os elementos da tela
        E houverem críticas na seção "Pendências"
        E os dados de aprovação estiverem sendo exibidos nos campos "Data da aprovação" e "Usuário" na seção Arquivo
        E os botões "Aprovar", "Reprovar" e "Reprocessar" estiverem bloqueados
        Mas os botões "Exportar Erros" e "Exportar Original" estiverem disponíveis
        Então os elementos da tela estão alinhados corretamente


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-aprovado-sem-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Aprovado sem pendências
        Dado que o admin aprovou um arquivo que resultou apenas em linhas com sucesso
        E acionou o botão "Detalhes" desta importação
        Quando visualizar todos os elementos da tela
        E não houver listagem na seção "Pendências"
        E os dados de aprovação estiverem sendo exibidos nos campos "Data da aprovação" e "Usuário" na seção Arquivo
        E os botões "Aprovar", "Reprovar", "Reprocessar" e "Exportar Erros" estiverem bloqueados
        Mas o botão "Exportar Original" estiver disponível
        Então os elementos da tela estão alinhados corretamente


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-reprovado-com-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Reprovado com pendências
        Dado que o admin reprovou um arquivo com linhas de sucesso e linhas de pendências
        E acionou o botão "Detalhes" desta importação
        Quando visualizar todos os elementos da tela
        E houverem críticas na seção "Pendências"
        E os dados de reprovação estiverem sendo exibidos nos campos "Data da aprovação", "Usuário" e "Motivo" na seção Arquivo
        E os botões "Aprovar", "Reprovar" e "Reprocessar" estiverem bloqueados
        Mas os botões "Exportar Erros" e "Exportar Original" estiverem disponíveis
        Então os elementos da tela estão alinhados corretamente


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-reprovado-sem-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Reprovado sem pendências
        Dado que o admin reprovou um arquivo que resultou apenas em linhas com sucesso
        E acionou o botão "Detalhes" desta importação
        Quando visualizar todos os elementos da tela
        E não houver listagem na seção "Pendências"
        E os dados de reprovação estiverem sendo exibidos nos campos "Data da aprovação", "Usuário" e "Motivo" na seção Arquivo
        E os botões "Aprovar", "Reprovar", "Reprocessar" e "Exportar Erros" estiverem bloqueados
        Mas o botão "Exportar Original" estiver disponível
        Então os elementos da tela estão alinhados corretamente


@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-com-status-processado-sem-pendencias.png,assets/A-acessar-detalhes-de-importacao-com-status-processado-com-pendencias.png
    Cenário: Acessar Detalhes de Importação com status Processado
        Dado que o admin aprovou um arquivo
        E acionou o botão "Detalhes" desta importação
        Quando visualizar todos os elementos da tela
        E os dados de aprovação estiverem sendo exibidos nos campos "Data da aprovação" e "Usuário" na seção Arquivo
        E os botões "Aprovar", "Reprovar" e "Reprocessar" estiverem bloqueados
        Mas o botão "Exportar Original" estiver disponível
        Então os elementos da tela estão alinhados corretamente
        Quando o arquivo processado possuir pendências
        E houver listagem de erros/críticas na seção "Pendências"
        Então o botão "Exportar Erros" também estará disponível
#65434 - Não está atualizando o status para Processado ou Falha no Processamento de Distribuição (de acordo com a situção)

@manual
@tarefa_#63790
@ajuste_#65487
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-exportar-erros-com-status-falha-no-processamento-e-aguardando-aprovacao.mp4,assets/Sell-Out-Daniel-COM-E-SEM-PENDENCIA-V.xlsx,assets/Sell-Out-Daniel-COM-E-SEM-PENDENCIA-V-rows.xlsx
    Cenário: Acessar Detalhes de Importação - Exportar Erros de arquivos com status de Falha no processamento e Aguardando Aprovação
        Dado que o admin acessou os "Detalhes" de um arquivo que resultou em linhas com pendências
        Quando acionar o botão "Exportar Erros" com status "Falha no processamento"
        Então o sistema irá fazer o download do arquivo "Relatório de Erros" em extensão '.xlsx' do respectivo arquivo
        E o arquivo baixado será conforme o arquivo importando com a coluna 'K' de "Erros" adicional
        E todos os registros exibidos na listagem de pendências desta importação deverão estar compilados na coluna "Erros" da respectiva linha do arquivo
        Quando acionar o botão "Exportar Erros" com status "Aguardando Aprovação"
        Então o sistema irá fazer o download do arquivo "Relatório de Erros" em extensão '.xlsx' do respectivo arquivo
        E o arquivo baixado será conforme o arquivo importando com a coluna 'K' de "Erros" adicional
        E todos os registros exibidos na listagem de pendências desta importação deverão estar compilados na coluna "Erros" da respectiva linha do arquivo
#65487 - Está sendo gerada também a linha de sucesso no relatorio de erros

@manual
@tarefa_#63790
@manual-result:success
@manual-last-tested:24-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-exportar-erros-ja-aprovado.mp4,assets/A-acessar-detalhes-de-importacao-exportar-erros-reprovado.mp4,assets/A-acessar-detalhes-de-importacao-exportar-erros-processado.mp4
    Cenário: Acessar Detalhes de Importação - Exportar Erros de arquivo já Aprovado, Reprovado ou Processado
        Dado que o admin acessou os "Detalhes" de um arquivo que resultou em linhas com pendências
        Quando acionar o botão "Exportar Erros" com status "Aprovado"
        Então o sistema irá fazer o download do arquivo "Relatório de Erros" em extensão '.xlsx' do respectivo arquivo
        E o arquivo baixado será conforme o arquivo importando com a coluna 'K' de "Erros" adicional
        E todos os registros exibidos na listagem de pendências desta importação deverão estar compilados na coluna "Erros" da respectiva linha do arquivo
        Quando acionar o botão "Exportar Erros" com status "Reprovado"
        Então o sistema irá fazer o download do arquivo "Relatório de Erros" em extensão '.xlsx' do respectivo arquivo
        E o arquivo baixado será conforme o arquivo importando com a coluna 'K' de "Erros" adicional
        E todos os registros exibidos na listagem de pendências desta importação deverão estar compilados na coluna "Erros" da respectiva linha do arquivo
        Quando acionar o botão "Exportar Erros" com status "Processado"
        Então o sistema irá fazer o download do arquivo "Relatório de Erros" em extensão '.xlsx' do respectivo arquivo
        E o arquivo baixado será conforme o arquivo importando com a coluna 'K' de "Erros" adicional
        E todos os registros exibidos na listagem de pendências desta importação deverão estar compilados na coluna "Erros" da respectiva linha do arquivo        


@manual
@tarefa_#63790
@ajuste_#65490
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-exportar-original-de-arquivo-com-status-aguardando-aprovacao.mp4,assets/A-acessar-detalhes-de-importacao-exportar-original-de-arquivo-com-status-falha-no-processamento.mp4
    Cenário: Acessar Detalhes de Importação - Exportar Original de arquivo com status de Falha no processamento e Aguardando Aprovação
        Dado que o admin acessou os "Detalhes" de um arquivo importado com status "Falha no processamento" com ou sem erros/críticas
        Quando acionar o botão "Exportar Original"        
        Então o sistema irá fazer o download do arquivo importado conforme nome real contendo os dados preenchidos no arquivo original        
        Quando acessar os "Detalhes" de um arquivo importado com status "Aguardando Aprovação" com ou sem erros/críticas
        E acionar o botão "Exportar Original"
        Então o sistema irá fazer o download do arquivo importado conforme nome real contendo os dados preenchidos no arquivo original        
#65490 - O sistema está deslogando sempre que clicamos em "Exportar Original"

@manual
@tarefa_#63790
@ajuste_#65490
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-exportar-original-de-arquivo-com-status-aprovado-e-reprovado.mp4,assets/A-acessar-detalhes-de-importacao-exportar-original-de-arquivo-com-status-processado.mp4
    Cenário: Acessar Detalhes de Importação - Exportar Original de arquivo já Aprovado, Reprovado ou Processado
        Dado que o admin acessou os "Detalhes" de um arquivo importado com status "Aprovado" com ou sem erros/críticas
        Quando acionar o botão "Exportar Original"
        Então o sistema irá fazer o download do arquivo importado conforme nome real contendo os dados preenchidos no arquivo original        
        Quando acessar os "Detalhes" de um arquivo importado com status "Reprovado" com ou sem erros/críticas
        E acionar o botão "Exportar Original"
        Então o sistema irá fazer o download do arquivo importado conforme nome real contendo os dados preenchidos no arquivo original 
        Quando acessar os "Detalhes" de um arquivo importado com status "Processado" com ou sem erros/críticas
        E acionar o botão "Exportar Original"
        Então o sistema irá fazer o download do arquivo importado conforme nome real contendo os dados preenchidos no arquivo original         
#65490 - O sistema está deslogando sempre que clicamos em "Exportar Original"

@manual
@tarefa_#63790
@ajuste_#65490
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/A-acessar-detalhes-de-importacao-voltar.mp4
    Cenário: Acessar Detalhes de Importação - Voltar
        Dado que o admin acessou os "Detalhes" de um arquivo importado
        Quando acionar o botão "Voltar"
        Então o sistema direcionará o admin de volta para a  para a listagem de importações
#65490 - O sistema está deslogando sempre que clicamos em "Exportar Original"

#18 CN