#language: pt

Funcionalidade: Processamento de sell out e validações
    Como administrador da campanha
    Quero cadastrar importações de vendas
    Para validar as regras necessárias no processamento do arquivo
    E prosseguir com posteriores aprovações/reprovações/reprocessamentos

    BD 
        SELECT * FROM `file_import_status`;
        SELECT * FROM `file_import` ORDER BY id DESC;
        SELECT * FROM `file_import_row` ORDER BY id DESC;
        SELECT * FROM `file_import_form` ORDER BY id DESC;
        SELECT * FROM `aiwa_sell_out` where `account_id` = 'IDdoUser' ORDER BY id DESC;
    
    Cron's
        1º sellOutProcessAiwa > cron mencionada nos cenários "cron de processamento" 

-----

Critérios de Aceitação:
Cron de processamento pega todos os arquivos no status "Aguardando processamento"
Enquanto o arquivo está em processamento e validando cada linha o status fica "Processando"
Arquivos com sucesso em todas as linhas, ficam no status "Aguardando Aprovação"
Arquivos com sucesso em pelo menos uma linha e outras com críticas, ficam no status "Aguardando Aprovação"
Arquivos com críticas de erros em todas as linhas, ficam no status "Falha no processamento"
Arquivos somente com críticas de alertas por ser produto com valor zero, ficam no status "Aguardando Aprovação" #Produto cadastrado com pontuação zero. Se este produto não pontua no período, prossiga com a aprovação
Arquivos somente com críticas de alertas por ser de novos cadastros de usuários, ficam no status "Aguardando Aprovação" #Usuário cadastrado e pontuação aplicada
Os campos de preenchimento obrigatório no arquivo são: "CNPJ Revenda", "CPF do vendedor", "Cód. Produto", "Quantidade", "Data da venda" e "Nota Fiscal ou pedido"
Os campos de preenchimento não obrigatório no arquivo são: "CPF Gerente Direto", "CPF Supervisor", "CPF Gerente Regional" e "Chave da nota"
"CNPJ Revenda" informado deve estar cadastrada nesta campanha - Tabela: account_campaign_resale
"CPF do vendedor" informado deve ser válido. Se não, dar crítica: 'CPF inválido.'
"CPF do vendedor" sendo válido e existente na campanha, deve ser do perfil "Vendedor". Se não, dar crítica: "Usuário não cadastrado como vendedor."
    - Tabelas: `account`; `acl_role`;
"CPF do vendedor" sendo "Vendedor" na campanha, deve estar atrelado a Revenda informada na coluna "CNPJ Revenda". Se não, dar crítica: "Vendedor não vinculado a revenda." #falha de escopo
    - Tabela: `account_resale`;
"CPF do vendedor" sendo válido e não existente na campanha, deve ser cadastrado automaticamente com status "Cadastro Pendente", no perfil "Vendedor", na Revenda respectiva e apresentar alerta na linha/coluna "Usuário cadastrado e pontuação aplicada."
    - Tabelas: `account`; `acl_role`; `account_resale`;
"CPF do Gerente Direto" deve ser válido. Se não, dar crítica: 'CPF inválido.'
"CPF do Gerente Direto" sendo válido e existente na campanha, deve ser do perfil "Gerente Direto". Se não, dar crítica: "Usuário não cadastrado como Gerente Direto."
    - Tabelas: `account`; `acl_role`;
"CPF do Gerente Direto" sendo "Gerente Direto" na campanha, deve estar atrelado a Revenda informada na coluna "CNPJ Revenda". Se não, dar crítica: "Gerente Direto não vinculado a revenda." #falha de escopo
    - Tabela: `account_resale`;
"CPF do Gerente Direto" sendo válido e não existente na campanha, deve ser cadastrado automaticamente com status "Cadastro Pendente", no perfil "Gerente Direto" e na Revenda respectiva e apresentar alerta na linha/coluna "Usuário cadastrado e pontuação aplicada."
    - Tabelas: `account`; `acl_role`; `account_resale`;
"CPF do Supevisor" deve ser válido. Se não, dar crítica: 'CPF inválido.'
"CPF do Supevisor" sendo válido e existente na campanha, deve ser do perfil "Supevisor". Se não, dar crítica: "Usuário não é Supevisor."
    - Tabelas: `account`; `acl_role`
"CPF do Supevisor" sendo "Supevisor" na campanha, deve estar atrelado a Revenda informada na coluna "CNPJ Revenda". Se não, dar crítica: "Supervisor não vinculado a revenda." #falha de escopo
    - Tabela: `account_resale`;
"CPF do Supevisor" sendo válido e não existente na campanha, deve ser cadastrado automaticamente com status "Cadastro Pendente", no perfil "Supevisor" e na Revenda respectiva e apresentar alerta na linha/coluna "Usuário cadastrado e pontuação aplicada."
    - Tabelas: `account`; `acl_role`; `account_resale`;
"CPF do Gerente Regional" deve ser válido. Se não, dar crítica: 'CPF inválido.'
"CPF do Gerente Regional" sendo válido e existente na campanha, deve ser do perfil "Gerente Regional". Se não, dar crítica: "Usuário não é Gerente Regional."
    - Tabelas: `account`; `acl_role`
"CPF do Gerente Regional" sendo "Gerente Regional" na campanha, deve estar atrelado a Revenda informada na coluna "CNPJ Revenda". Se não, dar crítica: "Gerente Regional não vinculado a revenda." #falha de escopo
    - Tabela: `account_resale`;
"CPF do Gerente Regional" sendo válido e não existente na campanha, deve ser cadastrado automaticamente com status "Cadastro Pendente", no perfil "Gerente Regional" e na Revenda respectiva e apresentar alerta na linha/coluna "Usuário cadastrado e pontuação aplicada."
    - Tabelas: `account`; `acl_role`; `account_resale`;
"SKU" ou "EAN" deve existir no cadastro de Produtos da campanha     
"SKU" ou "EAN" deve constar em uma Tabela de Pontos para a respectiva Revenda(Rede) na data da venda do arquivo   
"SKU" ou "EAN" deve ser Ativo na tabela da respectiva Revenda(Rede)
"SKU" ou "EAN" pode ser aprovado com valor zero na tabela de pontos da respectiva Revenda, mas exibir alerta na linha do arquivo para notificar o admin.
"Quantidade" deve ser numérico inteiro
"Quantidade" deve ser menor ou igual ao Limite de Vendas configurado
"Quantidade" deve ser maior que zero
"Data da venda" deve ser no formato DD/MM/AAAA
"Data da venda" deve estar dentro do período selecionado na importação do arquivo
"Nota Fiscal ou pedido" pode ser igual (duplicidade) na mesma loja, desde que para produtos diferentes e na mesma data, seja no arquivo ou no BD #verificar regra correta com Elder (confirmada)
"Nota Fiscal ou pedido" pode ser igual (duplicidade) para diferentes lojas, seja no arquivo ou no BD #verificar regra correta com Elder (confirmada)
"Nota Fiscal ou pedido" é considerada em duplicidade quando é da mesma loja, do mesmo produto e tem a mesma quantidade, INDEPENDENTE DE DATA, seja no arquivo ou no BD #verificar regra correta com Elder (confirmada)
"Nota Fiscal ou pedido" é considerada em duplicidade quando é para a mesma loja, mas com datas diferentes, INDEPENDENTE do produto ser diferente ou igual, seja no arquivo ou no BD #verificar regra correta com Elder (confirmada)
"Chave da nota" se preenchido, deve conter 44 dígitos
"Chave da nota" se preenchido, pode ser igual para a mesma NFs, seja no arquivo ou no BD
"Chave da nota" se preenchido, é considerada em duplicidade quando é para diferentes NFs, seja no arquivo ou no BD
Arquivo com erro em todas as linhas, o status vai para "Falha no processamento" após cron de processamento
Arquivo pode ser aprovado parcialmente, havendo sucesso em uma linha, o status do arquivo vai para "Aguardando aprovação" após cron de processamento.
Toda crítica (erro e alerta) deve ser salvo em BD e listado na tela de detalhes após processamento da cron, na seção pendências.
Erro em uma única coluna, deve considerar toda a linha com erro. Ou seja, ngm pontua.
Ao Reprocessar um arquivo o status deverá ser atualizado para "Aguardando processamento" novamente
Ao Reprocessar um arquivo e rodar cron de processamento os resultados de linhas com sucesso e linhas com pendências devem ser atualizados, bem como a listagem de Pendências conforme possíveis tratativas realizadas via admin
Ao Reprocessar um arquivo e rodar cron de processamento os erros/críticas que não foram tratados pelo admin devem permanecer sendo listados


---

@manual
@tarefa_#63789
@ajuste_#65285
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-somente-com-campos-obrigatorios-preenchidos-e-validos.png,assets/Sell-Out-Daniel-APENAS-CAMPOS-OBRIGATORIOS-III.xlsx
    Cenário: Importação de Sell Out somente com campos obrigatórios preenchidos e válidos
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu somente os campos obrigatórios com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" é única e não se duplica no mesmo arquivo, nem no banco
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e "Exportar original"
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências        
#65285 - Está criticando campos opcionais vazios


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-com-todos-os-campos-preenchidos-e-validos.mp4
    Cenário: Importação de Sell Out com todos os campos preenchidos e válidos
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu todos os campos obrigatórios e opcionais com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "CPF do Gerente Direto" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "CPF do Supervisor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "CPF do Gerente Regional" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" é única e não se duplica no mesmo arquivo, nem no banco
        E a "Chave da Nota" possui 44 dígitos, é única e não se duplica no mesmo arquivo, nem no banco
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e "Exportar original"
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências                


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-com-nf-e-chave-da-nota-duplicada-em-bd-e-aceita-revenda-igual.mp4
    Cenário: Importação de Sell Out com NF e Chave da nota duplicada em BD e aceita (Revenda igual)
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu todos os campos obrigatórios e opcionais com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" já existe em banco de dados para o mesmo CNPJ e mesma data, mas para diferentes produtos #duplicidade aceita seja no mesmo arquivo e/ou já existente no banco de dados [ambas devem ser aceitas]
        E a "Chave da Nota" possui 44 dígitos, e se repete para a mesma Nota Fiscal ou pedido já existente em banco de dados #duplicidade aceita seja no mesmo arquivo e/ou já existente no banco de dados [ambas devem ser aceitas]
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências                


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@ajuste_#65299
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-com-nf-e-chave-da-nota-duplicada-no-arquivo-aceita-revenda-igual.png,assets/Sell-Out-Daniel-11-2022-NF-e-CHAVE-Duplicada-em-DB-IV.xlsx
    Cenário: Importação de Sell Out com NF e Chave da nota duplicada no arquivo e aceita (Revenda igual)
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu todos os campos obrigatórios e opcionais com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" consta em duas linhas do arquivo para o mesmo CNPJ e mesma data, mas para diferentes produtos #duplicidade aceita seja no mesmo arquivo e/ou já existente no banco de dados [ambas devem ser aceitas]
        E a "Chave da Nota" possui 44 dígitos, e se repete para a mesma Nota Fiscal ou pedido em duas linhas do arquivo #duplicidade aceita seja no mesmo arquivo e/ou já existente no banco de dados [ambas devem ser aceitas]
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências   
#65299- Está criticando duplicidade de nota (arquivo com duas linhas, com a mesma nota, com produtos diferentes)

#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual 
@tarefa_#63789
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-com-nf-duplicada-em-bd-e-aceita-revenda-diferente.mp4
    Cenário: Importação de Sell Out com NF duplicada em BD e aceita (Revenda diferente)
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu todos os campos obrigatórios e opcionais com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" já existe em banco de dados para o outro CNPJ #duplicidade aceita seja no mesmo arquivo e/ou já existente no banco de dados [ambas devem ser aceitas]
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências 


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@ajuste_#65299
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-NF-e-CHAVE-Duplicada-em-DB-Revenda-Diferente-VII.xlsx,assets/A-importacao-de-sell-out-com-nf-e-chave-da-nota-duplicada-no-arquivo-aceita-revenda-diferente.png
    Cenário: Importação de Sell Out com NF duplicada no arquivo e aceita (Revenda diferente)
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu todos os campos obrigatórios e opcionais com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" consta em duas linhas do arquivo para diferentes CNPJ's #duplicidade aceita seja no mesmo arquivo e/ou já existente no banco de dados [ambas devem ser aceitas]
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências 
#65299- Está criticando duplicidade de nota (arquivo com duas linhas, com a mesma nota, com produtos diferentes)

@manual
@tarefa_#63789
@ajuste_#65285
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-somente-com-vendedor.png,assets/Sell-Out-Daniel-APENAS-VENDEDOR.xlsx
    Cenário: Importação de Sell Out somente com Vendedor
        Dado que o admin cadastrou um arquivo conforme modelo
        E a Revenda possui todos os perfis de "Gerente Direto", "Supervisor" e "Gerente Regional" vinculados
        Mas não preencheu as colunas "CPF Gerente Direto", "CPF Supervisor", "CPF Gerente Regional" no arquivo de vendas
        E preencheu somente os campos abaixo com valores válidos
        E o "CNPJ Revenda" está cadastrado para a campanha
        E o "CPF do vendedor" é valido, é da campanha, esta no perfil correto e vinculado a Revenda do arquivo (linha)
        E o "Cód. Produto" esta ativo na tabela, e a tabela esta ativa e vigente na data da venda para a Revenda do arquivo (linha)
        E a "Quantidade" está dentro do limite estabelecido no limite de vendas
        E a "Data da venda" está dentro do período selecionado no cadastro do arquivo
        E a "Nota Fiscal ou pedido" é única e não se duplica no mesmo arquivo, nem no banco
        E a "Chave da Nota" possui 44 dígitos, é única e não se duplica no mesmo arquivo, nem no banco
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Aguardando Aprovação" pois os campos obrigatórios estão devidamente preenchidos e sem pendências
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original' 
        Mas o botão "Exportar Erros" ficará desabilitado, pois não terão críticas na lista de pendências                
        E somente o Vendedor recebrá pontos, pois só recebem pontuação após a aprovação do arquivo, os CPF's informados no arquivo conforme cálculo #distribuição em nova feature
#65285 - Está criticando campos opcionais vazios

@manual
@tarefa_#63789
@ajuste_#65254
@ajuste_#65285
@ajuste_#65673
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-importacao-de-sell-out-com-campos-vazios-sem-vendedor.png,assets/A-importacao-de-sell-out-com-campos-vazios-sem-produto.png,assets/A-importacao-de-sell-out-com-campos-vazios-sem-quantidade.png,assets/A-importacao-de-sell-out-com-campos-vazios-sem-nota-fiscal.png,assets/A-importacao-de-sell-out-somente-com-campos-obrigatorios-preenchidos-e-validos.png,assets/Sell-Out-Daniel-APENAS-CAMPOS-OBRIGATORIOS-III.xlsx,assets/Sell-Out-Daniel-CPOS-OBRIGATORIOS-VAZIOS-IV.xlsx,assets/Sell-Out-Daniel-CPOS-OBRIGATORIOS-VAZIOS-IV.png,assets/A-VAZIO.mp4
    Esquema do Cenário: Importação de Sell Out com campos vazios
        Dado que o admin cadastrou um arquivo conforme modelo
        E não preencheu nenhum campo no arquivo ou não preencheu algum campo obrigatório
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento" pois não foram preenchidos em uma ou mais linhas os campos obrigatórios "<CNPJ Revenda>", "<CPF do vendedor>", "<Cód. Produto>", "<Quantidade>", "<Data da venda>" e "<Nota Fiscal ou pedido>" 
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E a seção arquivo correspondente a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Mas neste caso o reprocessar não irá mudar as críticas pois campos vazios não são passíveis de correções manuais do admin para reprocessamento
            Exemplos:
            | <CNPJ Revenda> | <CPF do vendedor> | <Cód. Produto> | <Quantidade>       | <Data da venda>          | <Nota Fiscal ou pedido> | <Resposta do sistema>                                                                                                                                                                              |
            | 'vazio'        | 'vazio'           | 'vazio'        | 'vazio'            | 'vazio'                  | 'vazio'                 | Informe o CNPJ da Revenda; Informe o CPF do vendedor; Informe o código do produto (EAN ou SKU).; Informe a quantidade de itens vendidos; Informe a data da venda; Informe o número da nota fiscal; |
            | 'vazio'        | 'de um vendedor'  | 'cadastrado'   | 'dentro do limite' | 'no período selecionado' | 'única'                 | Informe o CNPJ da Revenda;                                                                                                                                                                         |
            | 'cadastrada'   | 'vazio'           | 'cadastrado'   | 'dentro do limite' | 'no período selecionado' | 'única'                 | Informe o CPF do vendedor;                                                                                                                                                                         |
            | 'cadastrada'   | 'de um vendedor'  | 'vazio'        | 'dentro do limite' | 'no período selecionado' | 'única'                 | Informe o código do produto (EAN ou SKU);                                                                                                                                                          |
            | 'cadastrada'   | 'de um vendedor'  | 'cadastrado'   | 'vazio'            | 'no período selecionado' | 'única'                 | Informe a quantidade de itens vendidos;                                                                                                                                                            |
            | 'cadastrada'   | 'de um vendedor'  | 'cadastrado'   | 'dentro do limite' | 'vazio'                  | 'única'                 | Informe a data da venda;                                                                                                                                                                           |
            | 'cadastrada'   | 'de um vendedor'  | 'cadastrado'   | 'dentro do limite' | 'no período selecionado' | 'vazio'                 | Informe o número da nota fiscal;                                                                                                                                                                   |
        #fazer uma importação com todas as linhas do esquema no mesmo arquivo tbm, validando erros de campos vazios em diferentes linhas do msm arquivo
        #se der tempo -- fazer uma importação para cada linha do esquema, validando individualmente todos e cada campo vazio
#65285 - Está criticando campos opcionais vazios
#65254 - Não está criticando os campos vazios
#65673 - Deixou de criticar a ausência do cód. produto

@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CNPJ-REVENDA-INVALIDO-VI.xlsx,assets/A-importacao-de-sell-out-com-valores-invalidos-no-cnpj-revenda.png,assets/A-importacao-de-sell-out-com-valores-invalidos-no-cnpj-revenda-II.png,assets/A-importacao-de-sell-out-com-valores-invalidos-no-cnpj-revenda-III.png,assets/A-importacao-de-sell-out-com-valores-invalidos-no-cnpj-revenda-IV.png,assets/A-importacao-de-sell-out-com-valores-invalidos-no-cnpj-revenda-V.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos no CNPJ Revenda
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna <CNPJ Revenda> preencheu com valor inválido em uma ou mais linhas, ou com CNPJ não cadastrado na campanha
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a linha ou todas as linhas possuem críticas no CNPJ Revenda
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá na seção arquivo os dados correspondentes a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
            Exemplos:
            | <CNPJ Revenda>                 | <Resposta do sistema>                                                                  |
            | 'não cadastrada e sem máscara' | Revenda 00.000.000/0000-00 não cadastrada.                                             |
            | 'não cadastrada e com máscara' | Revenda 00.000.000/0000-00 não cadastrada.                                             |
            | '9.673.075/0001-08'            | Completar com ZERO à esquerda. Revenda 09.673.075/0001-08 não cadastrada;              |
            | '9673075000108'                | Completar com ZERO à esquerda. Revenda 09.673.075/0001-08 não cadastrada;              |
            | 'cadastrada de outra campanha' | Revenda xx.xxx.xxx/xxxx-xx não cadastrada.                                             |
            | 'teste'                        | Informe o CNPJ da Revenda; ou Revenda não cadastrada. ou Valor inválido (algo similar) |
        #fazer validação alterando tbm a formatação do campo CNPJ Revenda, o ideal é por padrão ser texto para não cortar as numerações/zeros à esquerda
        #preencher as demais colunas obrigatórios corretamente, para validação isolada no CNPJ Revenda
        #se der tempo -- fazer uma importação para cada linha do esquema, validando individualmente. 
        #Fazer tbm tds as linhas no msm arquivo. -- usar este arquivo no reprocessamento, cenário na sequência


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:22-11-2022
@manual-test-evidence:assets/A-reprocessamento-de-arquivo-para-cnpj-revenda-cadastrada-II.mp4,assets/A-reprocessamento-de-arquivo-para-cnpj-revenda-cadastrada.mp4
    Cenário: Reprocessamento de arquivo para CNPJ Revenda cadastrada
        Dado que o admin cadastrou um arquivo com o "CNPJ Revenda" não cadastrado na campanha
        E foi exibida a crítica de "Revenda não cadastrada." para uma ou mais linhas do arquivo
        Quando o admin acessar a tela de Revendas
        E cadastrar corretamente o CNPJ desta respectiva Revenda informado no arquivo de vendas importado
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar" desta importação
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então as linhas que continham crítica de "Revenda não cadastrada" não serão mais exibidas nas pendências, pois agora o CNPJ esta cadastrado para uma Revenda da Campanha
        E as pendências deste arquivo serão reduzidas somente as linhas de Valor Inválido no campo CNPJ Revenda
        E o status do arquivo será "Aguardando Aprovação"
        E todos os botões serão exibidos "Aprovar", "Reprovar", "Reprocessar", "Exportar erros" e 'Exportar original'
        #utilizar caso com CNPJ que inicie com número zero e não preencher o zero no arquivo de sell out - objetivo: o sistema precisa completar com zero à esquerda e encontrar a revenda
            #caso o sistema não encontre, solicitar ajuste


@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos no CPF Vendedor
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna "<CPF do vendedor>" preencheu com valores inválidos
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no CPF Vendedor
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
            Exemplos:
            | <CPF do vendedor>                               | <Resposta do sistema>                 |
            | 2'documento inválido e não cadastrado'           | CPF inválido.                         |
            | 3'documento inválido e cadastrado'               | CPF inválido.                         |
            | 4'documento VÁLIDO, cadastrado, em outro perfil' | Usuário não cadastrado como vendedor. |
            | 5'Vendedor cadastrado, sem Revenda'              | Vendedor não vinculado a revenda.    |
            | 6'Vendedor cadastrado, em outra Revenda'         | Vendedor não vinculado a revenda.     |
            #se der tempo -- fazer uma importação para cada linha do esquema, validando individualmente primeiro
            #Fazer tbm uma importação com tds no msm arquivo. -- usar este arquivo no reprocessamento, cenário na sequência
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.

@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Cenário: Reprocessamento de arquivo com pendências no CPF do Vendedor
        Dado que o admin cadastrou um arquivo com o "CPF Vendedor" 
        Mas retornou críticas referente a cargo e revenda do Vendedor
        Quando o admin acessar a tela de edição deste usuário
        E corrigir seu cargo para Vendedor
        E corrigir sua Revenda conforme a do arquivo
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar"
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então as pendências deste arquivo serão reduzidas somente as linhas de CPF inválido, pois o(s) CPF(s) agora é(são) do perfil Vendedo, está(ão) na Revenda conforme arquivo sell out
        E as informações de qnt de linhas com sucesso, e linha com pendências na seção arquivo serão atualizadas
        E o status do arquivo será "Aguardando Aprovação"
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo no "Exportar Erros" tbm será atualizado, exportando a nova lista de pendências
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.


@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos no CPF do Gerente Direto
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna "<CPF do Gerente Direto>" preencheu com valores inválidos
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Gerente Direto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
            Exemplos:
            | <CPF do Gerente Direto>                         | <Resposta do sistema>                       |
            | 'documento inválido e não cadastrado'           | CPF inválido.                               |
            | 'documento inválido e cadastrado'               | CPF inválido.                               |
            | 'documento VÁLIDO, cadastrado, em outro perfil' | Usuário não cadastrado como Gerente Direto. |
            | 'Gerente Direto cadastrado, sem Revenda'        | Gerente Direto não vinculado a revenda.     |
            | 'Gerente Direto cadastrado, em outra Revenda'   | Gerente Direto não vinculado a revenda.     |
        #confirmar resposta 'Gerente Direto não vinculado a revenda'. Possível falha de escopo 
        #preencher as demais colunas obrigatórios corretamente, para validação isolada    
        #se der tempo -- fazer uma importação para cada linha do esquema, validando individualmente primeiro
        #Fazer tbm uma importação com tds as linhas no msm arquivo. -- usar este arquivo no reprocessamento, cenário na sequência
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.

@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Cenário: Reprocessamento de arquivo com pendências no CPF do Gerente Direto
        Dado que o admin cadastrou um arquivo com o "Gerente Direto" 
        Mas retornou críticas referente a cargo e/ou revenda
        Quando o admin acessar a tela de edição deste usuário
        E corrigir seu cargo para Gerente Direto
        E corrigir sua Revenda conforme a do arquivo
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar"
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então as pendências deste arquivo serão reduzidas somente as linhas de CPF inválido, pois o(s) CPF(s) agora é(são) do perfil Gerente Direto, está(ão) na Revenda conforme arquivo sell out
        E as informações de qnt de linhas com sucesso, e linha com pendências na seção arquivo serão atualizadas
        E o status do arquivo será "Aguardando Aprovação"
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo no "Exportar Erros" tbm será atualizado, exportando a nova lista de pendências
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.

@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos no CPF do Supervisor
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna "<CPF do Supervisor>" preencheu com valores inválidos
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Supervisor
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
            Exemplos:
            | <CPF do Supervisor>                             | <Resposta do sistema>                   |
            | 'documento inválido e não cadastrado'           | CPF inválido.                           |
            | 'documento inválido e cadastrado'               | CPF inválido.                           |
            | 'documento VÁLIDO, cadastrado, em outro perfil' | Usuário não cadastrado como Supervisor. |
            | 'Supervisor cadastrado, sem Revenda'            | Supervisor não vinculado a revenda.     |
            | 'Supervisor cadastrado, em outra Revenda'       | Supervisor não vinculado a revenda.     |
        #confirmar resposta 'Supervisor não vinculado a revenda'. Possível falha de escopo 
        #preencher as demais colunas obrigatórios corretamente, para validação isolada    
        #se der tempo -- fazer uma importação para cada linha do esquema, validando individualmente primeiro
        #Fazer tbm uma importação com tds no msm arquivo. -- usar este arquivo no reprocessamento, cenário na sequência
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.


@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Cenário: Reprocessamento de arquivo com pendências no CPF do Supervisor
        Dado que o admin cadastrou um arquivo com o "Supervisor" 
        Mas retornou críticas referente a cargo e/ou revenda
        Quando o admin acessar a tela de edição deste usuário
        E corrigir seu cargo para Supervisor
        E corrigir sua Revenda conforme a do arquivo
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar"
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então as pendências deste arquivo serão reduzidas somente as linhas de CPF inválido, pois o(s) CPF(s) agora é(são) do perfil Supervisor, está(ão) na Revenda conforme arquivo sell out
        E as informações de qnt de linhas com sucesso, e linha com pendências na seção arquivo serão atualizadas
        E o status do arquivo será "Aguardando Aprovação"
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo no "Exportar Erros" tbm será atualizado, exportando a nova lista de pendências
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.


@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos no CPF do Gerente Regional
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna "<CPF do Gerente Regional>" preencheu com valores inválidos
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Gerente Regional
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
            Exemplos:
            | <CPF do Gerente Regional>                       | <Resposta do sistema>                        |
            | 'documento inválido e não cadastrado'           | CPF inválido.                                |
            | 'documento inválido e cadastrado'               | CPF inválido.                                |
            | 'documento VÁLIDO, cadastrado, em outro perfil' | Usuário não cadastrado como Gerente Regional |
            | 'Gerente Regional cadastrado, sem Revenda'      | Gerente Regional não vinculado a revenda.    |
            | 'Gerente Regional cadastrado, em outra Revenda' | Gerente Regional não vinculado a revenda.    |
        #confirmar resposta 'Gerente Regional não vinculado a revenda'. Possível falha de escopo 
        #preencher as demais colunas obrigatórios corretamente, para validação isolada    
        #se der tempo -- fazer uma importação para cada linha do esquema, validando individualmente primeiro
        #Fazer tbm uma importação com tds no msm arquivo. -- usar este arquivo no reprocessamento, cenário na sequência
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.


@manual
@tarefa_#63789
@ajuste_#65338
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.xlsx,assets/A-importacao-de-sell-out-com-CPFS-INVALIDOS-PARA-VENDEDOR-GERENTES-E-SUPERVISOR-VI.png,assets/A-importacao-de-sell-out-APOS-REPROCESSAMENTO.png
    Cenário: Reprocessamento de arquivo com pendências no CPF do Gerente Regional
        Dado que o admin cadastrou um arquivo com o "Gerente Regional" 
        Mas retornou críticas referente a cargo e/ou revenda
        Quando o admin acessar a tela de edição deste usuário
        E corrigir seu cargo para Gerente Regional
        E corrigir sua Revenda conforme a do arquivo
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar"
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então as pendências deste arquivo serão reduzidas somente as linhas de CPF inválido, pois o(s) CPF(s) agora é(são) do perfil Gerente Regional, está(ão) na Revenda conforme arquivo sell out
        E as informações de qnt de linhas com sucesso, e linha com pendências na seção arquivo serão atualizadas
        E o status do arquivo será "Aguardando Aprovação"
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo no "Exportar Erros" tbm será atualizado, exportando a nova lista de pendências
#65338- Usuário sem Revenda ou de Outra Revenda - Não está criticando.


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTOS-INEXISTENTE.xlsx,assets/A-importacao-de-sell-out-com-produto-inexistente-antes-de-reprocessar.png,assets/A-importacao-de-sell-out-com-produto-inexistente-DEPOIS-de-reprocessar.mp4
    Cenário: Importação de Sell Out com produto inexistente + Reprocessamento de cadastro de produto e inclusão na tabela
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        Mas preencheu o "Cód. Produto" com "SKU ou EAN" que não consta cadastrado na campanha
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Produto não cadastrado"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin realizar o cadastro deste "SKU/EAN" corretamente #essa condição 'Quando+E+E' não se aplica ao sucesso deste teste, é apena um passo para validar o reprocessamento
        E cadastrar o produto na tabela de pontuação ativa da Revenda e vigente na data da venda
        E clicar em "Reprocessar" nos "Detalhes" desta importação
        E rodar a cron de processamento do arquivo de Vendas novamente
        Então o sistema atualiza o status para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes
        Então não terão críticas na lista de pendências, já que agora o 'SKU / EAN' existe e é ativo na tabela de pontuação da Revenda ativa e vigente na data da venda
        E exibirá as informações na seção arquivo correspondentes ao reprocessamento da importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado já que não constam mais críticas

#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:23-11-2022
@manual-last-tested:success
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTOS-INEXISTENTE-NA-TABELA.xlsx,assets/A-importacao-de-sell-out-com-produto-nao-existente-na-tabela-da-revenda-antes-de-reprocessar.png,assets/A-importacao-de-sell-out-com-produto-nao-existente-na-tabela-da-revenda-DEPOIS-de-reprocessar.mp4
    Cenário: Importação de Sell Out com produto não existente na tabela da revenda + Reprocessamento com cadastro do SKU/EAN na tabela
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        E preencheu o "Cód. Produto" com "SKU ou EAN" que existe na campanha
        Mas não consta na tabela de pontuação desta revenda, e sim de outra Revenda
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Não há vigência deste produto para a data da venda informada."
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin cadastrar o produto no status ativo na tabela de pontuação ativa da Revenda e vigente na data da venda
        E clicar em "Reprocessar" nos "Detalhes" desta importação
        E rodar a cron de processamento do arquivo de Vendas novamente
        Então o sistema atualiza o status para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes
        Então não terão críticas na lista de pendências, já que agora o 'SKU / EAN' existe e é ativo na tabela de pontuação da Revenda ativa e vigente na data da venda
        E exibirá as informações na seção arquivo correspondentes ao reprocessamento da importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado já que não constam mais críticas


@manual
@tarefa_#63789
@ajuste_#65379
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTOS-INATIVO-NA-TABELA-ATIVA-II.xlsx,assets/A-importacao-de-sell-out-com-produto-inativo-na-tabela-ativa.png,assets/A-importacao-de-sell-out-com-produto-inativo-na-tabela-ativa-II.png,assets/A-importacao-de-sell-out-com-produto-inativo-na-tabela-ativa-III.png
    Cenário: Importação de Sell Out com produto Inativo na Tabela Ativa + Reprocessamento com produto ativado
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        Mas preencheu o "Cód. Produto" com 'SKU ou EAN' de produto que esta inativo da tabela de pontuação da Revenda ativa e vigente na data da venda
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Produto informado está inativo"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin acessar a edição desta tabela #essa condição 'Quando+E+E' não se aplica ao sucesso deste teste, é apena um passo para validar o reprocessamento
        E ativar o respectivo produto na tabela em questão
        E o sistema criar uma nova tabela de pontos com este produto ativo 
        E clicar em "Reprocessar" nos "Detalhes" desta importação
        E rodar a cron de processamento do arquivo de Vendas novamente
        Então o sistema atualiza o status para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes
        Então não terão críticas na lista de pendências, já que agora o 'SKU / EAN' está ativo na tabela de pontuação da Revenda ativa e vigente na data da venda
        E exibirá as informações na seção arquivo correspondentes ao reprocessamento da importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado já que não constam mais críticas
#65379- Não está criticando produto Inativo na Tabela Ativa

@manual
@tarefa_#63789
@ajuste_#65382
@manual-result:success
@manual-last-tested:05-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTOS-INATIVO-NA-TABELA-INATIVA-V.xlsx,assets/Sell-Out-Daniel-11-2022-PRODUTOS-INATIVO-NA-TABELA-INATIVA-V.mp4
    Cenário: Importação de Sell Out com produto Inativo na Tabela Inativa + Reprocessamento com Tabela Ativada
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        Mas preencheu o "Cód. Produto" com 'SKU ou EAN' de produto que esta inativo da tabela de pontuação da Revenda inativa vigente na data da venda
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Não há vigência deste produto para a data da venda informada."
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin acessar a edição desta tabela #essa condição 'Quando+E+E' não se aplica ao sucesso deste teste, é apena um passo para validar o reprocessamento
        E ativar a respectiva Tabela em questão
        E o sistema criar uma nova tabela de pontos com este produto inativo (mantendo o status no produto conforme sua última tabela) 
        E clicar em "Reprocessar" nos "Detalhes" desta importação
        E rodar a cron de processamento do arquivo de Vendas novamente
        Então o sistema atualiza o status para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes
        Então a lista de pendências exibe a(s) crítica(s) de "Produto informado está inativo" na lista de pendências, já que o 'SKU / EAN' permanecerá inativo na nova tabela de pontuação ativa da Revenda e vigente na data da venda
#65382- Está criticando "Produto não cadastrado", ao invés de ""Não há vigência deste produto para a data da venda informada"


@manual
@tarefa_#63789
@ajuste_#65382
@manual-result:success
@manual-last-tested:05-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTOS-ATIVO-NA-TABELA-INATIVA-III.xlsx,assets/Sell-Out-Daniel-11-2022-PRODUTOS-ATIVO-NA-TABELA-INATIVA-III.mp4
    Cenário: Importação de Sell Out com produto Ativo na Tabela Inativa + Reprocessamento com Tabela Ativada
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        E preencheu o "Cód. Produto" com 'SKU ou EAN' de produto que esta ativo na tabela de pontuação da Revenda 
        Mas a tabela está inativa na data da venda
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Não há vigência deste produto para a data da venda informada."
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin acessar a edição desta tabela #essa condição 'Quando+E+E' não se aplica ao sucesso deste teste, é apena um passo para validar o reprocessamento
        E ativar a respectiva Tabela em questão
        E o sistema criar uma nova tabela de pontos com este produto Ativo (mantendo o status no produto conforme sua última tabela) 
        E clicar em "Reprocessar" nos "Detalhes" desta importação
        E rodar a cron de processamento do arquivo de Vendas novamente
        Então o sistema atualiza o status para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes
        Então não terão críticas na lista de pendências, já que agora o 'SKU / EAN' está ativo na tabela de pontuação da Revenda ATIVA e vigente na data da venda
        E exibirá as informações na seção arquivo correspondentes ao reprocessamento da importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado já que não constam mais críticas
#65382- Está criticando "Produto não cadastrado", ao invés de ""Não há vigência deste produto para a data da venda informada"


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@ajuste_#65383
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTOS-NAO-EXISTE-NA-NOVA-TABELA-II.xlsx,assets/A-importacao-de-sell-out-com-produto-nao-existente-na-nova-tabela-da-revenda.png
    Cenário: Importação de Sell Out com produto não existente na NOVA tabela da revenda
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        E preencheu o "Cód. Produto" com "SKU ou EAN" de um produto que consta na tabela antiga da Revenda
        Mas que agora esta Inativa (a tabela ficou inativa para cadastro de nova tabela sem esse produto)
        E o Cód Produto não consta na Nova Tabela de Pontuação da Revenda ativa e vigente na data da venda
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Não há vigência deste produto para a data da venda informada."
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
#65383- Não está criticando


@manual
@tarefa_#63789
@ajuste_#65382
@manual-result:success
@manual-last-tested:05-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-REVENDA-SEM-TABELA-III.xlsx,assets/Sell-Out-Daniel-11-2022-REVENDA-SEM-TABELA-III.mp4
    Cenário: Importação de Sell Out com Revenda sem tabela de pontuação cadastrada + Reprocessamento após cadastro de tabela para a Revenda(Rede)
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        Mas não existe nenhuma tabela de pontuação para a Revenda, logo não encontrou o "SKU ou EAN" preenchido
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Não há vigência deste produto para a data da venda informada."
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin cadastrar uma tabela de pontuação ativa para a Revenda conforme data da venda, contendo o respectivo produto com status ativo
        E clicar em "Reprocessar" nos "Detalhes" desta importação
        E rodar a cron de processamento do arquivo de Vendas novamente
        Então o sistema atualiza o status para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes
        Então não terão críticas na lista de pendências, já que agora a Revenda possui tabela de pontuação ativa e vigente na data da venda
        E 'SKU / EAN' existe e é ativo na tabela de pontuação
        E exibirá as informações na seção arquivo correspondentes ao reprocessamento da importação 
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar" e 'Exportar original'
        Mas o botão "Exportar Erros" ficará desabilitado já que não constam mais críticas       
#65382- Está criticando "Produto não cadastrado", ao invés de ""Não há vigência deste produto para a data da venda informada"


@manual
@tarefa_#63789
@ajuste_#65382
@manual-result:success
@manual-last-tested:05-12-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-TABELA-FORA-DA-VIGENCIA-IV.xlsx,assets/Sell-Out-Daniel-11-2022-TABELA-FORA-DA-VIGENCIA-IV.mp4
    Cenário: Importação de Sell Out com Tabela fora da Vigência
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        E preencheu o "Cód. Produto" com 'SKU ou EAN' de produto que esta ativo na tabela de pontuação da Revenda 
        Mas a tabela está fora da vigência da data da venda
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas no Cód. Produto
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "Não há vigência deste produto para a data da venda informada."
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"        
#65382- Está criticando "Produto não cadastrado", ao invés de ""Não há vigência deste produto para a data da venda informada"



@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-PRODUTO-COM-VALOR-ZERO-E-OUTRO-COM-VALOR-10-II.xlsx,assets/A-importacao-de-sell-out-com-valor-zero-para-o-produto-antes-de-reprocessar-I.png,assets/Sell-Out-Daniel-11-2022-PRODUTO-COM-VALOR-ZERO-E-OUTRO-COM-VALOR-10-II-exportacao-de-erros.xlsx,assets/A-importacao-de-sell-out-com-valor-zero-para-o-produto-DEPOIS-de-reprocessar-I.mp4
    Cenário: Importação de Sell Out com valor zero para o Produto + Reprocessamento alterando valor
        Dado que o admin cadastrou um arquivo onde o produto informado possui valor zero na tabela de pontuação desta Revenda(Rede) para os perfis informados no arquivo
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status do arquivo para "Aguardando Aprovação"
        Quando o admin acessar a tela de detalhes desta importação
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E exibe nas pendências a seguinte mensagem nesta linha do arquivo para a respectiva coluna (pefil) que possui pontuação zerada:
        |Produto cadastrado com pontuação zero. Se este produto não pontua no período, prossiga com a aprovação.|
        Mas não impede sua aprovação, pois a linha possui apenas um alerta informativo ao admin
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original' 
        E o arquivo do "Exportar Erros" irá exportar conforme o alerta na lista de pendências de produto com valor zero
        Quando o admin alterar o valor deste produto na tabela de pontuação da Revenda(Rede) do perfil que possuía pontuação zerada
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar"
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então o status do arquivo será atualizado para "Aguardando Aprovação"
        E o alerta de valor zero deste Produto não será mais exibido, pois agora o produto não possui mais valor zero para nenhum perfil    
        E as informações de qnt de linhas com sucesso e com pendências na seção arquivo serão atualizadas
        E agora o botão "Exportar Erros" ficará desabilitado, pois não terá mais críticas na lista de pendências
        #preencher as demais colunas obrigatórios corretamente, para validação isolada


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@ajuste_#65409
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-LINHAS-TOTALMENTE-DUPLICADAS-III.xlsx,assets/A-importacao-de-sell-out-com-valores-duplicados-na-nota-fiscal-no-mesmo-arquivo.png
    Esquema do Cenário: Importação de Sell Out com valores duplicados na Nota Fiscal no mesmo arquivo (2)
        Dado que o admin cadastrou um arquivo conforme modelo
        Quando preencher a mesma "Nota Fiscal" em mais de uma linha do arquivo para a mesma Revenda, o mesmo Produto e a mesma Quantidade 'INDEPENDENTE DE DATA'
        E rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Nota Fiscal
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E na lista de pendências exibe a crítica "Nota fiscal em duplicidade. Já existe uma linha para a mesma nota, produto e quantidade"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        #preencher as demais colunas obrigatórias corretamente, para validação isolada
        #OBS.: Confirmada a palavra valor na mensagem da critica. Correto é qnt (Fabio deu ok)    
        #OBS.2: A mensagem da doc foi alterada, removendo a 'data' e sinalizando que é por linha           
#65409- Além da crítica "Nota fiscal em duplicidade. Já existe uma linha para a mesma nota, produto e quantidade", está criticando tb "Nota fiscal em duplicidade no arquivo."


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-LINHAS-TOTALMENTE-DUPLICADAS-NO-BD.xlsx,assets/A-importacao-de-sell-out-com-valores-duplicados-na-nota-fiscal-com-registro-em-BD.mp4
    Esquema do Cenário: Importação de Sell Out com valores duplicados na Nota Fiscal com registro em BD (2)
        Dado que o admin cadastrou um arquivo conforme modelo
        Quando preencher uma "Nota Fiscal" que já consta em banco de dados para a mesma Revenda, o mesmo Produto e a mesma Quantidade 'INDEPENDENTE DE DATA'
        E rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Nota Fiscal
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E na lista de pendências exibe a crítica "Nota fiscal em duplicidade. Já existe uma importação para a mesma nota, produto e quantidade"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        #preencher as demais colunas obrigatórias corretamente, para validação isolada
        #OB.: Confirmada a palavra valor na mensagem da critica. Correto é qnt (Fabio deu ok)
        #OBS.2: A mensagem da doc foi alterada, removendo a 'data' e sinalizando que é por linha 


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-LINHAS-DUPLICADAS-COM-DATA-DIFERENTE.xlsx,assets/A-importacao-de-sell-out-com-valores-duplicados-na-nota-fiscal-no-mesmo-arquivo.mp4
    Esquema do Cenário: Importação de Sell Out com valores duplicados na Nota Fiscal no mesmo arquivo (3)
        Dado que o admin cadastrou um arquivo conforme modelo
        Quando preencher uma "Nota Fiscal" em mais de uma linha do arquivo para a mesma Revenda, com diferentes data de venda
        E rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Nota Fiscal
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E na lista de pendências exibe a crítica "Nota fiscal em duplicidade no arquivo"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        #preencher as demais colunas obrigatórias corretamente, para validação isolada


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-LINHAS-TOTALMENTE-DUPLICADAS-NO-BD-IV.xlsx,assets/A-importacao-de-sell-out-com-valores-duplicados-na-nota-fiscal-com-registro-em-BD-IV.mp4
    Esquema do Cenário: Importação de Sell Out com valores duplicados na Nota Fiscal com registro em BD (3)
        Dado que o admin cadastrou um arquivo conforme modelo
        Quando preencher uma "Nota Fiscal" que já consta em banco de dados para a mesma Revenda, com diferentes data de venda
        E rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Nota Fiscal
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E na lista de pendências exibe a crítica "Nota fiscal já importada anteriormente"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        #preencher as demais colunas obrigatórias corretamente, para validação isolada


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@ajuste_#65411
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CHAVES-DUPLICADAS-NO-ARQUIVO-II.xlsx,assets/A-iomportacao-de-sell-out-com-valores-duplicados-na-chave-da-nota-no-mesmo-arquivo.png
    Esquema do Cenário: Importação de Sell Out com valores duplicados na Chave da nota no mesmo arquivo
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu a mesma "Chave da Nota" em mais de uma linha do arquivo para notas fiscais com números diferentes
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Chave da nota
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E na lista de pendências exibe as críticas "Esta chave já está cadastrada para outra nota fiscal com número diferente na planilha" em todas as linhas com duplicidade
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
#65411 - Não está criticando

#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@ajuste_#65412
@manual-result:success
@manual-last-tested:28-11-202
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CHAVES-DUPLICADAS-NO-BD-II.xlsx,assets/A-importacao-de-sell-out-com-valores-duplicados-na-chave-da-nota-com-registro-em-bd.png
    Esquema do Cenário: Importação de Sell Out com valores duplicados na Chave da nota com registro em BD
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu a mesma "Chave da Nota" para uma nota fiscal '123456789'
        Mas essa "Chave da Nota" já existe no banco do dados para a nota fiscal '789456123'
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Chave da nota
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E na lista de pendências exibe a crítica "Esta chave já está cadastrada para outra nota fiscal com número diferente" #sugerir diferenciar as msg de duplicidade no arquivo ou em BD
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
#65412 - Não está criticando


#CONFIRMAR CENÁRIO ABAIXO COM ELDER (ok)
@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-CHAVE-MENOR-QUE-44-DIGITOS.xlsx,assets/A-importacao-de-sell-out-com-chave-da-nota-com-menos-de-44-digitos.png
    Cenário: Importação de Sell Out com Chave da nota com menos de 44 dígitos 
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu com valores válidos as colunas obrigatórias
        Mas preencheu a "Chave da Nota" com menos de 44 dígitos ou com mais de 44 dígitos
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas na Chave da Nota
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe a(s) crítica(s) de "A chave da nota deve conter 44 dígitos"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"   


@manual
@tarefa_#63789
@ajuste_#65418
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-QUANTIDADES-INVALIDAS-IV.xlsx,assets/A-importacao-de-sell-out-com-valores-invalidos-na-quantidade-II.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos na Quantidade
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna "<Quantidade>" preencheu com valores inválidos
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de Quantidade
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondente a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
            Exemplos:
            | <Quantidade>                   | <Resposta do sistema>                                 |
            | 'maior que o limite de vendas' | A quantidade informada é maior que o limite de vendas |
            | '-10'                          | Quantidade inválida                                   |
            | '10,50'                        | Quantidade inválida                                   |
            | 'teste'                        | Quantidade inválida                                   |
            | '0,09'                         | Quantidade inválida                                   |
            #preencher as demais colunas obrigatórias corretamente, para validação isolada
            #fazer importação e usar este resultado no reprocessamento na sequência
#65418 - Não está criticando o valor 10,50


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/A-reprocessamento-de-arquivo-com-pendencias-na-quantidade.mp4
    Cenário: Reprocessamento de arquivo com pendências na Quantidade
        Dado que o admin cadastrou um arquivo com críticas referente ao campo "<Quantidade>" devido ao limite configurado
        Quando o admin acessar a tela de Limite de Vendas
        E adequar o limite conforme a maior quantidade do arquivo de vendas
        E voltar nos detalhes deste arquivo importado
        E clicar em "Reprocessar"
        Então o sistema vai alterar o status do arquivo para "Aguardando processamento"
        Quando a cron de processamento de arquivos sell out rodar novamente
        Então o status do arquivo será atualizado para "Aguardando Aprovação"
        E a(s) pendência(s) referente a quatidade não será(ão) mais exibida(s), pois agora o limite atende a quantidade da linha/venda
        E as informações de qnt de linhas com sucesso e com pendências na seção arquivo serão atualizadas
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo no "Exportar Erros" tbm será atualizado, exportando somente o que não é passível de tratativas pelo admin que permanecerá na lista de pendências



@manual
@tarefa_#63789
@ajuste_#65421
@manual-result:success
@manual-last-tested:30-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-DATAS-INVALIDAS-VI.xlsx,assets/A-importacao-de-sell-out-com-valores-invalidos-na-data-da-venda.png
    Esquema do Cenário: Importação de Sell Out com valores inválidos na Data da Venda
        Dado que o admin cadastrou um arquivo conforme modelo
        Mas na coluna "<Data da venda>" preencheu com valores inválidos
        E com data fora do período selecionado no cadastro desta importação
        Quando rodar a cron de processamento do arquivo de Vendas
        Então o sistema atualiza o status para "Falha no processamento", pois a única linha possui crítica ou todas as linhas possuem críticas de 'Data da venda'
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então o sistema exibirá os detalhes da respectiva importação com o ID na url
        E exibirá as informações na seção arquivo correspondentes a respectiva importação 
        E a lista de pendências exibe as críticas conforme "<Resposta do sistema>"
        E os botões disponíveis serão apenas os "Reprocessar", "Exportar Erros" e "Exportar Original"
        Quando o admin acionar o botão "Reprocessar"
        Então o sistema reprocessa o arquivo
        Mas as críticas serão reexibidas umas vez que não são passíveis de correções via admin
            Exemplos:
            | <Data da venda>                                               | <Resposta do sistema>                                             |
            | AAAA/MM/DD                                                    | Data inválida (sugestão)                                          |
            | teste                                                         | Data inválida (sugestão)                                          |
            | DD/MM/AAAA mas diferente do período selecionado na importação | A data de venda é diferente do período selecionado na importação. |
        #preencher as demais colunas obrigatórias corretamente, para validação isolada
#65421 - Não criticou as datas "AAAA/MM/DD" e "TESTE"


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-NOVOS-CPFS.xlsx,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional.png,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional-II.png
    Cenário: Importação de Sell Out com novo CPF Vendedor
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu uma linha com um novo documento válido na coluna "CPF do vendedor" 
        Quando rodar a cron de processamento do arquivo de Vendas
        Então sistema realizará automaticamente o cadastro deste CPF no perfil "Vendedor" desta campanha com status "Cadastro Pendente"
        E fará o vínculo do novo usuário com a respetiva revenda do arquivo
        E atualiza o status desta importação para "Aguardando Aprovação", pois a linha possui alerta e não erro
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então a lista de pendências exibe um alerta nesta linha conforme abaixo:
            | Usuário cadastrado e pontuação aplicada. |
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo do "Exportar Erros" irá exportar o alerta exibido nas pendências
        #preencher as demais colunas obrigatórios corretamente, para validação isolada


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-NOVOS-CPFS.xlsx,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional.png,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional-II.png
    Cenário: Importação de Sell Out com novo CPF do Gerente Direto
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu uma linha com um novo documento válido na coluna "CPF do Gerente Direto" 
        Quando rodar a cron de processamento do arquivo de Vendas
        Então sistema realizará automaticamente o cadastro deste CPF no perfil "Gerente Direto" desta campanha com status "Cadastro Pendente"
        E fará o vínculo do novo usuário com a respetiva revenda do arquivo
        E atualiza o status desta importação para "Aguardando Aprovvação", pois a linha possui alerta e não erro
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então a lista de pendências exibe um alerta nesta linha conforme abaixo:
            | Usuário cadastrado e pontuação aplicada. |
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo do "Exportar Erros" irá exportar o alerta exibido nas pendências
        #preencher as demais colunas obrigatórios corretamente, para validação isolada


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-NOVOS-CPFS.xlsx,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional.png,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional-II.png
    Cenário: Importação de Sell Out com novo CPF do Supervisor
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu uma linha com um novo documento válido na coluna "CPF do Supervisor" 
        Quando rodar a cron de processamento do arquivo de Vendas
        Então sistema realizará automaticamente o cadastro deste CPF no perfil "Supervisor" desta campanha com status "Cadastro Pendente"
        E fará o vínculo do novo usuário com a respetiva revenda do arquivo
        E fará o vínculo do novo usuário com a respetiva revenda do arquivo
        E atualiza o status desta importação para "Aguardando Aprovvação", pois a linha possui alerta e não erro
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então a lista de pendências exibe um alerta nesta linha conforme abaixo:
            | Usuário cadastrado e pontuação aplicada. |
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo do "Exportar Erros" irá exportar o alerta exibido nas pendências
        #preencher as demais colunas obrigatórios corretamente, para validação isolada


@manual
@tarefa_#63789
@manual-result:success
@manual-last-tested:23-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-NOVOS-CPFS.xlsx,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional.png,assets/A-importacao-de-sell-out-com-novo-CPF-Vendedor-Gerente-Direto-Supervisor-e-Gerente-Regional-II.png
    Cenário: Importação de Sell Out com novo CPF do Gerente Regional
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu uma linha com um novo documento válido na coluna "CPF do Gerente Regional" 
        Quando rodar a cron de processamento do arquivo de Vendas
        Então sistema realizará automaticamente o cadastro deste CPF no perfil "Gerente Regional" desta campanha com status "Cadastro Pendente"
        E fará o vínculo do novo usuário com a respetiva revenda do arquivo
        E fará o vínculo do novo usuário com a respetiva revenda do arquivo
        E atualiza o status desta importação para "Aguardando Aprovvação", pois a linha possui alerta e não erro
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então a lista de pendências exibe um alerta nesta linha conforme abaixo:
            | Usuário cadastrado e pontuação aplicada. |
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo do "Exportar Erros" irá exportar o alerta exibido nas pendências
        #preencher as demais colunas obrigatórios corretamente, para validação isolada



@manual
@tarefa_#63789
@ajuste_#65426
@manual-result:success
@manual-last-tested:28-11-2022
@manual-test-evidence:assets/Sell-Out-Daniel-11-2022-NOVOS-CPFS-III.xlsx,assets/A-importacao-de-sell-out-com-novos-cpfs-no-mesmo-arquivo.png
    Cenário: Importação de Sell Out com novos CPFs no mesmo arquivo
        Dado que o admin cadastrou um arquivo conforme modelo
        E preencheu todos os campos obrigatórios corretamente
        E preencheu linhas com novos documentos válidos nas colunas "CPF do vendedor", "CPF do Gerente Direto", "CPF do Supervisor" e "CPF do Gerente Regional" #sejam todos na mesma linha e/ou em linhas diferentes
        Quando rodar a cron de processamento do arquivo de Vendas
        Então sistema realizará automaticamente os cadastros destes CPFs nos respectivos perfis "Vendedor", "Gerente Direto", "Supervisor" e "Gerente Regional" desta campanha
        E todos no status "Cadastro Pendente"
        E fará o vínculo dos novos usuários com a respetiva revenda do arquivo para cada usuário (linha)
        E atualiza o status desta importação para "Aguardando Aprovvação", pois a linha possui alerta e não erro
        E disponibiliza o botão "Detalhes" nesta importação
        Quando o admin acessar a tela de detalhes
        Então a lista de pendências exibe um alerta nesta linha conforme abaixo:
            | Usuário cadastrado e pontuação aplicada. |
        E os botões disponíveis serão "Aprovar", "Reprovar", "Reprocessar", "Exportar Erros" e 'Exportar original'
        E o arquivo do "Exportar Erros" irá exportar o alerta exibido nas pendências
        #preencher as demais colunas obrigatórios corretamente, para validação isolada
#65426 - Os perfis Gerente Direto, Supervisor e Gerente Regional foram vinculados à revenda incorreta.

#42 CN         