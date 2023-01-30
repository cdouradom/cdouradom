#language: pt

Funcionalidade: Tabela de Pontuação - Novo Produto na Tabela e Edição de Produtos da Tabela
Como usuário administrador ativo na Plataforma
Quero acessar a edição de dados dos produtos das tabelas ativas
Para seus valores e status

    BD 
        product_points_import_history
        product_points_import_resale
        account_campaign_product_points

-----    

Critérios de Aceitação:
Exibir breadcrumb
Cadastro com acesso através do menu: Tabela de Pontuação / +Novo Produto
Edição com acesso através do menu: Tabela de Pontuação / Ações / Editar Dados
No modal de cadastro exibir um cabeçalho "+Novo Produto"
Modal de cadastro disponibilizar os campos abaixo com os botões "Cancelar" e "Salvar":
    - "Tabela de pontuação" -- conforme a tabela do produto que o amdin estava na tela anterior e não permite edição 
    - "SKU" -- obrigatório
    - "EAN" -- obrigatório
    - "Pontos Vendedor" -- obrigatório
    - "Pontos Gerente Direto"
    - "Pontos Supervisor"
    - "Pontos Gerente Regional"
    - "Status" -- obrigatório
Modal de cadastro os campos de preenchimento obrigatório são: "Tabela de pontuação", "SKU", "EAN", "Pontos Vendedor" e "Status"
Modal de cadastro o campo "Tabela de pontuação" virá preenchido conforme a tabela do produto que o amdin estava na tela anterior e não permite edição 
Modal de cadastro o "SKU" e "EAN" informado deve estar cadastrado na tela de "Produtos"
Modal de cadastro o "SKU" / "EAN" informado deve estar com status ativo na tela de "Produtos"

No modal de edição exibir um cabeçalho "Editar Dados"
Modal de edição disponibilizar os campos abaixo com os botões "Cancelar" e "Salvar":
    - "Tabela de pontuação" -- bloqueado para edição
    - "SKU" -- bloqueado para edição
    - "EAN" -- bloqueado para edição
    - "Pontos Vendedor" -- editável e obrigatório
    - "Pontos Gerente Direto" -- editável 
    - "Pontos Supervisor" -- editável 
    - "Pontos Gerente Regional" -- editável 
    - "Status" -- editável e obrigatório
Tela de edição os campos "Tabela de pontuação", "SKU" e "EAN" virão preenchidos conforme a tabela e o produto que o amdin acionou a edição e não permite edição
Tela de edição não exibir/salvar valor vazio, sendo sempre igual ou maior que zero #referência Canon
Modal de cadastro/edição o campo "Status":
    - virá o atual da tabela e lista suspensa com as opções “Ativo” e “Inativo” 
Modal de cadastro/edição o campo "Pontos":
    - aceitar somente valores maiores ou iguais a zero 
    - aceitar somente no formato determinado (Ex.: 0.05; 0.01; 0.99; 1; 10; 100; 1000.00; 10000.00) e aplicar duas casas decimais por padrão


---


@manual
@Tarefa_#:61019
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-novo-produto-acessar-layout-e-cancelar.mp4
    Cenário: Tabela de Pontuação - Novo Produto - Acessar, Layout e Cancelar
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Cadastrar"
        Então o sistema redireciona para a tela "Novo Produto" da 'Tabela de Pontos' que está filtrada na tela
        E os campos "Tabela de pontuação", "SKU", "EAN", "Pontos Vendedor" e "Status" são obrigatórios para cadastro
        E no Status exibem as opções "Ativo" e "Inativo", sem opção vazio
        Quando acionar o botão "Cancelar"
        Então o sistema retorna para a tela "Tabela de Pontuação" mantendo a que já estava filtrada


@manual
@Tarefa_#:61019
@ajuste_#:62494
@ajuste_#:62789
@ajuste_#:62792
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-I.png,assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-II.png,assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-III.png,assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-IV.png,assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-V.png,assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-VI.mp4,assets/A-tabela-de-pontos-edicao-campo-obrigatorio-vendedor-corrigido.mp4,assets/A-tabela-de-pontos-cadastro-campo-obrigatorio-vendedor-corrigido.mp4,assets/A-valor-negativo-pts.mp4
    Cenário: Tabela de Pontuação - Novo Produto - Valores inválidos
        Dado que o admin está na tela de "+Novo Produto"
        Quando preencher os campos "<Tabela>", "<SKU>", "<EAN>", "<Pontos Vendedor>", "<Pontos Gerente Direto>", "<Pontos Supervisor>", "<Pontos Gerente Regional>" com valores inválidos ou vazios
        E acionar o botão "Salvar"
        Então o sistema exibe a mensagem "<Resposta do sistema>"
            Exemplos:
            | <Tabela> | <SKU>                  | <EAN>                  | <Pontos Vendedor> | <Pontos Gerente Direto> | <Pontos Supervisor> | <Pontos Gerente Regional> | <Resposta do sistema>                                                                          |
            | 'vazio'  | 'vazio'                | 'vazio'                | 'vazio'           | 'vazio'                 | 'vazio'             | 'vazio'                   | Campo de preenchimento obrigatório para:"Tabela de pontuação", "SKU", "EAN", "Pontos Vendedor" |
            | 'vazio'  | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 1                 | 0                       | 0                   | 0                         | Tabela Obrigatória                                 |
            | Da lista | 'vazio'                | 'cadastrado e ativo'   | 1                 | 0                       | 0                   | 0                         | Campo de preenchimento obrigatório para:"SKU"                                                  |
            | Da lista | 'não cadastrado'       | 'não cadastrado      ' | 1                 | 0                       | 0                   | 0                         | Produto não encontrado ou inativo na tabela de produto                                                                         |
            | Da lista | 'cadastrado e INATIVO' | 'cadastrado e INATIVO' | 1                 | 0                       | 0                   | 0                         | Produto não encontrado ou inativo na tabela de produto                                                                               |
            | Da lista | 'cadastrado e ativo'   | 'vazio'                | 1                 | 0                       | 0                   | 0                         | EAN obrigatório                                                  |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 'vazio'           | 0                       | 0                   | 0                         | Campo de preenchimento obrigatório para:"Pontos Vendedor"                                      |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | -10               | -0.05                   | -1000               | -100.50                   | O valor informado deve ser maior ou igual a 0 (zero)                                           |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | -1.00             | -10.00                  | -00                 | -1                        | O valor informado deve ser maior ou igual a 0 (zero)                                           |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 10.000            | 10.000                  | 10.000              | 10.000                    | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 10.033            | 10.033                  | 10.033              | 10.033                    | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 1.000,00          | 1.000,00                | 1.000,00            | 1.000,00                  | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 1.000.00          | 1.000.00                | 1.000.00            | 1.000.00                  | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 5,00              | 5,00                    | 5,00                | 5,00                      | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 15,00             | 15,00                   | 15,00               | 15,00                     | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 1.555,57          | 1.555,57                | 1.555,57            | 1.555,57                  | Valor inválido                                                                                 |
            | Da lista | 'cadastrado e ativo'   | 'cadastrado e ativo'   | 0,05              | 0,05                    | 0,05                | 0,05                      | Valor inválido                                                                                 |
#62494 - Está sendo permitido salvar com o campo "Pontos Vendedor" vazio. De acordo com o escopo, ele é de preenchimento obrigatorio.
#62789 - Está permitindo gravar valor negativo nos campos de ponto (colando o dado dentro do campo).
#62792 - Está permitindo gravar valor inválido nos campos de ponto.

@manual
@Tarefa_#:61019
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-novo-produto-cadastro-valido-e-salvar-I.mp4,assets/A-tabela-de-pontuacao-novo-produto-cadastro-valido-e-salvar-II.mp4,assets/A-tabela-de-pontuacao-novo-produto-cadastro-valido-e-salvar-III.mp4,assets/A-tabela-de-pontuacao-novo-produto-cadastro-valido-e-salvar-IV.mp4,assets/A-tabela-de-pontuacao-novo-produto-auto-complete-II.mp4
    Cenário: Tabela de Pontuação - Novo Produto - Cadastro Válido e Salvar
        Dado que o admin está na tela de "Novo Produto"
        Quando preencher os campos "<Tabela>", "<SKU>", "<EAN>", "<Pontos Vendedor>", "<Pontos Gerente Direto>", "<Pontos Supervisor>", "<Pontos Gerente Regional>" e "<Status>" com valores válidos
        E acionar o botão "Salvar"
        Então o sistema valida/trata os campos preenchidos conforme "<Comportamento do sistema>"
        E acrescenta este "SKU/EAN" nesta tabela
        E vai exibir um modal/alerta de "Produto cadastrado com com sucesso" #ou algo similar
        E redirecionar o admin de volta para a "Tabela de Pontuação" mantendo na que já estava filtrada e que foi inserido o novo produto #se for modal, ao clicar em Ok
        E exibirá na respectiva tabela o Part Number na listagem com todos os campos:
            | Categoria    | SKU          | EAN          | Produto               | Pontos                             | Status             | Botão/Ações              |
            | 'do produto' | 'do produto' | 'do produto' | 'nome/modelo produto' | 'tooltip de ponto para cada cargo' | 'Ativo ou Inativo' | Editar Dados / Histórico |
            Exemplos:
            | <Tabela> | <SKU>                | <EAN>                | <Pontos Vendedor> | <Pontos Gerente Direto> | <Pontos Supervisor> | <Pontos Gerente Regional> | <Status>| <Resposta do sistema>                                                                                     |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 1                 | 1                       | 1                   | 1                         | Ativo   | Registra o valor de cada perfil com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 10                | 10                      | 10                  | 10                        | Ativo   | Registra o valor de cada perfil com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 100               | 100                     | 100                 | 100                       | Ativo   | Não é possível digitar o valor de 100 "sem as casas decimais"                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 1000              | 5                       | 1                   | 10                        | Ativo   | Não é possível digitar o valor de 1000 "sem as casas decimais". Registra o valor dos demais perfis com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 10.00             | 0                       | 0.5                 | 0.55                      | Ativo   | Não é possível digitar o valor de 0.5. Registra o valor dos demais perfis com 2 casas decimais, e deixa zero a pontuação do perfil Gerente Direto   |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 100.00            | 10.01                   | 10.25               | 0                         | Ativo   | Registra o valor de cada perfil com 2 casas decimais, e deixa zero a pontuação do perfil Gerente Regional |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 1000.00           | 50.09                   | 0                   | 150.91                    | Ativo   | Registra o valor de cada perfil com 2 casas decimais, e deixa zero a pontuação do perfil Supervisor       |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 0.09              | 0.1                     | 0.1                 | 0.1                       | Ativo   | Não é possível digitar o valor de 0.1. Registra o valor do perfil Vendedor com duas casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 5.58              | 0.37                    | 0.38                | 0.39                      | Inativo | Registra o valor de cada perfil com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 15.30             | 0.30                    | 5.50                | 1                         | Inativo | Registra o valor de cada perfil com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 150.66            | 3                       | 7.07                | 5.99                      | Inativo | Registra o valor de cada perfil com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 15050.99          | 135.00                  | 138.01              | 250.99                    | Inativo | Registra o valor de cada perfil com 2 casas decimais                                                      |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 1.50              | 0                       | 0                   | 0                         | Inativo | Registra o valor com 2 casas decimais para Vendedor, e deixa zero a pontuação dos demais perfis           |
            | Da lista | 'cadastrado e ativo' | 'cadastrado e ativo' | 10000.00          | 0                       | 0                   | 0                         | Inativo | Registra o valor com 2 casas decimais para Vendedor, e deixa zero a pontuação dos demais perfis           |


@manual
@Tarefa_#:61019
@manual-result:success
@manual-last-tested:21-10-2022 
@manual-test-evidence:assets/A-tabela-de-pontuacao-acessar-edicao-validar-layout-e-cancelar.mp4
    Cenário: Tabela de Pontuação - Acessar Edição, validar Layout e Cancelar
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Ações" de um produto da tabela filtrada
        E acionar a opção "Editar Dados"
        Então o sistema redireciona para a tela "Editar Produto" deste 'SKU' nesta 'Tabela de Pontos'
        E os campos "Tabela de pontuação", "SKU", "EAN" e "Nome Produto" são exibidos bloqueados para edição
        Mas os campos "Pontos" de todos os perfil e o "Status" são editáveis
        E o Status exibe as opções "Ativo" e "Inativo", sem opção vazio
        Quando acionar o botão "Cancelar"
        Então o sistema retorna para a tela "Tabela de Pontuação"
        

@manual
@Tarefa_#:61019
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-editar-status-I.mp4,assets/A-tabela-de-pontuacao-editar-status-II.mp4
    Cenário: Tabela de Pontuação - Editar Status
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Ações" de um produto da tabela filtrada
        E acionar a opção "Editar Dados"
        Então o sistema redireciona para a tela "Editar Dados" deste 'SKU/EAN' nesta 'Tabela de Pontos'
        Quando o admin alterar de "Ativo" para "Inativo"
        E acionar o botão "Salvar"
        Então o sistema salva a alteração 
        E exibe um modal de "Alteração realizada com sucesso"
        E redireciona o admin de volta para a listagem da "Tabela de Pontuação"
        E exibe o produto na listagem agora com status "Inativo"
        Mas não altera o status do Produto, nem o status deste produto em outras tabelas
        Quando o admin acionar o botão "Ações" de outro produto da tabela filtrada
        E acionar a opção "Editar" 
        Então o sistema redireciona para a tela "Editar Dados" deste 'SKU/EAN' nesta 'Tabela de Pontos'
        Quando o admin alterar de "Inativo" para "Ativo"
        E acionar o botão "Salvar"
        Então o sistema salva a alteração neste produto nesta tabela
        E exibe um modal de "Alteração realizada com sucesso"
        E redireciona o admin de volta para a listagem da "Tabela de Pontuação"
        E exibe o produto na listagem agora com status "Ativo"
        Mas não altera o status do Produto, nem o status deste produto em outras tabelas



@manual
@Tarefa_#:61019
@manual-result:success
@manual-last-tested:21-10-2022  
@manual-test-evidence:assets/A-tabela-de-pontuacao-editar-ponto.mp4
    Cenário: Tabela de Pontuação - Editar Ponto
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Ações" de um produto da tabela filtrada
        E acionar a opção "Editar Dados"
        Então o sistema redireciona para a tela "Editar Dados" deste 'SKU/EAN' nesta 'Tabela de Pontos'
        Quando o admin alterar o valor de "Pontos Vendedor", "Pontos Gerente Direto", "Pontos Supervisor" e "Pontos Gerente Regional"
        E acionar o botão "Salvar"
        Então o sistema salva a alteração neste produto nesta tabela
        E exibe um modal de "Alteração realizada com sucesso"
        E redireciona o admin de volta para a listagem da "Tabela de Pontuação"
        E exibe no 'tooltip' da coluna pontos os novos valores de "Pontos" de cada "Perfil"
        Mas não altera os pontos deste produto em outras tabelas para nenhum perfil
    #alterar valores do produto na tabela individualmente e de todos os pefil
    #usar produto que exista em outra tabela e com valores diferentes, para validar que os valores na outra tabela não foram impactados


@manual
@Tarefa_#:61019
@ajuste_#:62789
@ajuste_#:62792
@manual-result:success
@manual-last-tested:21-10-2022
@manual-test-evidence:assets/A-tabela-de-pontuacao-novo-produto-valores-invalidos-VI.mp4.assets/A-valor-negativo-pts.mp4
    Cenário: Tabela de Pontuação - Editar Ponto com valor inválido
        Dado que existem registros listados na tela "Tabela de Pontuação"
        Quando o admin acionar o botão "Ações" de um produto da tabela filtrada
        E acionar a opção "Editar Dados"
        Então o sistema redireciona para a tela "Editar Dados" deste 'Part Number' nesta 'Tabela de Pontos'
        Quando o admin alterar com valores inválidos os campos "Pontos Vendedor", "Pontos Gerente Direto", "Pontos Supervisor" e "Pontos Gerente Regional"
        E acionar o botão "Salvar"
        Então o sistema exibe a "<Mensagem do sistema>"
        E não faz nenhuma alteração no produto desta tabela
            Exemplos:
            | <Pontos Vendedor> | <Pontos Gerente Direto> | <Pontos Supervisor> | <Pontos Gerente Regional> | <Resposta do sistema>                                |
            | -10               | -0.05                   | -1000               | -100.50                   | O valor informado deve ser maior ou igual a 0 (zero) |
            | -00               | 0                       | 0                   | 0                         | O valor informado deve ser maior ou igual a 0 (zero) |
            | 10                | -0.05                   | 10                  | 10                        | O valor informado deve ser maior ou igual a 0 (zero) |
            | 10                | 0                       | -10                 | 10                        | O valor informado deve ser maior ou igual a 0 (zero) |
            | 10                | 5                       | 0                   | -10                       | O valor informado deve ser maior ou igual a 0 (zero) |
            | -1.00             | -10.00                  | -00                 | -1                        | O valor informado deve ser maior ou igual a 0 (zero) |
            | 10.000            | 10.000                  | 10.000              | 10.000                    | Valor inválido                                       |
            | 10.033            | 10.033                  | 10.033              | 10.033                    | Valor inválido                                       |
            | 1.000,00          | 1.000,00                | 1.000,00            | 1.000,00                  | Valor inválido                                       |
            | 1.000.00          | 1.000.00                | 1.000.00            | 1.000.00                  | Valor inválido                                       |
            | 5,00              | 5,00                    | 5,00                | 5,00                      | Valor inválido                                       |
            | 15,00             | 15,00                   | 15,00               | 15,00                     | Valor inválido                                       |
            | 1.555,57          | 1.555,57                | 1.555,57            | 1.555,57                  | Valor inválido                                       |
            | 0,05              | 0,05                    | 0,05                | 0,05                      | Valor inválido                                       |
#62789- Está sendo permitido colar pontos negativos nos campos
#62792- Está sendo possível digitar valores inválidos nos campos

@manual
@Tarefa_#:61019
@ajuste_#:62795
@manual-result:success
@manual-last-tested:14-11-2022
@manual-test-evidence:assets/A-log-de-edicao-em-BD.png
    Cenário: Log de Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos:
        #verificar
#62795- Não está gravando o IP no log de alteração dos dados do produto.