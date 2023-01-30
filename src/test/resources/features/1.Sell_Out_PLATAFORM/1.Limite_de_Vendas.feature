#language: pt

Funcionalidade: Cadastro e Edição de Limite para o Sell Out
Como usuário administrador ativo da Plataforma
Quero acessar o Limite de Vendas
Para configurar a quantidade limite de venda de um item a ser considerada na distribuição de pontos

    BD 
        SELECT * FROM `account_module`; -- ID 28 SellOut Quantidade
        SELECT * FROM `account_module_setup` WHERE account_module_id = '28'; -- account_id é a campanha e status 1 é ativo
        SELECT * FROM `account_module_setup_params` WHERE `account_module_setup_id` = '6728'; -- value é o limite
-----

Critérios de Aceitação:
Acessado através do menu:  Gerencial > Sell Out > Limite de Vendas
Exibir breadcrumb
Exibir nome na seção / título na tela: "Cadastrar limite"
Exibir apenas um campo de preenchimento obrigatório: "Quantidade"
Exibir dois botões: "Cancelar" e "Salvar"
Campo "quantidade" não pode ser vazio
Campo "quantidade" deve ser numérico e inteiro #não aceitar letras, ponto (.) ou vírgula (,)
Campo "quantidade" deve ser maior que zero
Campo "quantidade" deve trazer pré-cadastrado a quantidade '1000' "cadastro feito via migration pelo dev"
Botão "Cancelar" direciona para a listagem de importação de vendas "..Plataform/FileImportSellOut"
Botão "Salvar" validar preenchimento do campo, apresenta as críticas abaixo em cad situação e sendo valor válido cadastra/altera o limite na campanha
    - Preencha a quantidade
    - Quantidade deve ser maior que zero
Trazer pré-cadastrado o valor de 1000 nesta campanha
Apenas o perfil de admin interno da PP poderá acessar

---

@manual
@tarefa_#63614
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-nao-exibir-menu-para-perfil-admin-aiwa.png
    Cenário: Não exibir menu para perfil Admin Aiwa
        Dado que o admin com perfil 'Admin Aiwa' está logado na Plataforma
        Quando acionar o menu "Gerencial"
        Então não visualizará menu "Sell Out" com os submenus "Limite de Vendas" e "Importação de Vendas"


@manual
@tarefa_#63614
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-acessar-limite-de-vendas-e-cancelar.png,assets/A-acessar-limite-de-vendas-e-cancelar-II.png,assets/A-acessar-limite-de-vendas-e-cancelar-III.png
    Cenário: Acessar Limite de Vendas e Cancelar
        Dado que o admin com perfil 'Admin Aiwa' está logado na Plataforma
        Quando acionar o menu "Gerencial"
        E acionar o menu "Sell Out"
        E acionar o submenu "Limite de Vendas"
        Então o sistema direciona para a tela "Cadastrar Limite"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumb | Gerencial / Sell Out / Limite de Vendas           |
            | Título     | Cadastrar Limite                                  |
            | Quantidade | numérico e inteiro "trazer valor 1000 por padrão" |
            | Botões     | Cancelar / Salvar                                 |
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de importação de vendas "..Plataform/FileImportSellOut"


@manual
@tarefa_#63616
@ajuste_#:65117
@manual-result:success
@manual-last-tested:25-11-2022
@manual-test-evidence:assets/A-quantidade-com-valores-invalidos.png,assets/A-quantidade-com-valores-invalidos-valor-zero-corrigido.mp4
    Cenário: Quantidade com valores inválidos
        Dado que o admin acessou a tela "Cadastrar Limite"
        Quando preencher a "<Quantidade>" com valores inválidos
        E acionar o botão "Salvar"
        Então o sistema exibe a "<Mensagem do sistema>"
        E por padrão mantém o admin na tela "Cadastrar Limite"
            Exemplos:
            | <Quantidade> | <Mensagem do sistema>                                                          |
            | 'vazio'      | "Preencha a quantidade" ao acionar Salvar                                      |
            | teste        | bloquear digitação ou criticar campo "Preencha a quantidade" ao acionar Salvar |
            | 0,50         | bloquear digitação ou criticar campo "Preencha a quantidade" ao acionar Salvar |
            | -1000        | Valor deve ser maior que 0 (zero)                                              |
            | 0            | Valor deve ser maior que 0 (zero)                                              |
#65117 - Está permitindo salvar limite igual a zero (0)


@manual
@tarefa_#63616
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-quantidade-com-valores-validos.png,assets/A-quantidade-com-valores-validos-II.png,assets/A-quantidade-com-valores-validos-III.png,assets/A-quantidade-com-valores-validos-IV.png,assets/A-quantidade-com-valores-validos-V.png,assets/A-quantidade-com-valores-validos-VI.png
    Cenário: Quantidade com valor válido
        Dado que o admin acessou a tela "Cadastrar Limite"
        Quando preencher a "<Quantidade>" com valores válidos
        E acionar o botão "Salvar"
        Então o sistema exibe um modal/mensagem de sucesso "Limite de vendas cadastrado com sucesso!"
        E por padrão mantém o admin na tela "Cadastrar Limite"
        E configura para essa campanha o limite estabelecido que pode ser conferido na tabela 'account_module_setup_params'
            Exemplos:
            | <Quantidade> |
            | 1500         |
            | 100          |
            | 10           |


@manual
@tarefa_#63616
@manual-result:success
@manual-last-tested:21-11-2022
@manual-test-evidence:assets/A-alterar-por-quantidade-de-valor-valido.mp4
    Cenário: Alterar por quantidade de valor válido
        Dado que o admin acessou a tela "Cadastrar Limite"
        Quando preencher a "<Quantidade>" com novos valores válidos
        E acionar o botão "Salvar"
        Então o sistema exibe um modal/mensagem de sucesso "Limite de vendas cadastrado com sucesso!"
        E por padrão mantém o admin na tela "Cadastrar Limite"
        E altera o limite estabelecido para essa campanha que pode ser conferido na tabela 'account_module_setup_params'
            Exemplos:
            | <Quantidade nova> |
            | 25000             |
            | 10500             |
            | 1000              |

#5 CN