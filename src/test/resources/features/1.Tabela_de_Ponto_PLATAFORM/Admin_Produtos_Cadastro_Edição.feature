#language: pt

Funcionalidade: Cadastro e Edição de Produtos
Como usuário administrador ativo na Plataforma
Quero acessar o cadastro de produtos da campanha
Para realizar cadastro de produtos em massa e individual, e fazer edições nos produtos na campanha
    BD
        account_campaign_product

-----

Critérios de Aceitação:
Acesso através dos botões "Novo Produto" na listagem de Produtos
Na tela "Novo Produto" - Exibir breadcrumb
Na tela "Novo Produto" - Disponibilizar os campos "SKU", "EAN", "Produto", "Categoria", "Subcategoria", "Status" e os botões "Cancelar" e "Salvar"
Todos os campos são de preenchimento obrigatório
Os campos "Categoria" e "Subcategoria" são listas suspensas somente com as cadastradas na campanha
O campo "EAN" obrigatoriamente deve ter exatamente 13 caracateres
Os campos "SKU" e "Produto" são alfanuméricos
O "Status" é uma lista suspensa com as opções "Inativo" e "Ativo"
O "SKU" deve ser único na campanha
O "EAN" deve ser único na campanha
O "Produto" pode ser repetido para diferentes SKU 
Na edição - apenas os campos "SKU" e "EAN" não podem ser alterados, todos os demais podem
Na edição - alterações salvas devem refletir na listagem de Produtos instantâneamente

---

@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-novo-produto-acessar-validar-layout-e-cancelar.mp4
    Cenário: Novo Produto - Acessar, validar layout e Cancelar
        Dado que o admin está na tela da listagem de "Produtos"
        Quando acionar o botão "Novo Produto"
        Então o sistema redireciona para outra tela [ou exibe um modal] para o "Cadastro de Produto"
        Quando o usuário visualizar todos os elementos da tela
        E o "Status" vier por padrão "Ativo"
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Produtos"



@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-novo-produto-dados-validos-I.mp4,assets/A-novo-produto-dados-validos-II.mp4
    Cenário: Novo Produto - Dados válidos
        Dado que o admin está na tela da listagem de "Produtos"
        Quando acionar o botão "Novo Produto"
        Então o sistema redireciona para outra tela [ou exibe um modal] para o "Cadastro de Produto"
        Quando preencher com valores válidos os campos "<SKU>", "<EAN>", "<Categoria>", "<Subcategoria>", "<Produto>" e "<Status>"
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações, realiza o cadastro do produto
        E exibe um modal de Sucesso "Produto cadastrado com sucesso"
        E lista-o na tela/listagem de produtos conforme dados cadastrados
            Exemplos:
            | <SKU>        | <EAN>         | <Categoria> | <Subcategoria>   | <Produto> | <Status> |
            | PN Teste B33 | 1112223334567 | Fogão       | COOKTOP 5 bocas  | Teste B33 | Ativo    |
            | PN Teste B44 | 1112223334568 | Fogão       | COOKTOP 4 bocas  | Teste B44 | Ativo    |
            | PN Teste B55 | 1112223334569 | Forno       | FORNO DE BANCADA | Teste B55 | Ativo    |
            | PN Teste B66 | 1112223334560 | Forno       | FORNO DE BANCADA | Teste B66 | Inativo  |
            | PN Teste B77 | 2223334445678 | Forno       | FORNO DE EMBUTIR | Teste B77 | Inativo  |
            | PN Teste B88 | 2223334445679 | Forno       | FORNO DE EMBUTIR | Teste B88 | Inativo  |
            | PN Teste B99 | 2223334445670 | Forno       | MICROONDAS       | Teste B66 | Ativo    |
            | PN Teste B91 | 3334445556667 | Forno       | MICROONDAS       | Teste B66 | Ativo    |
    #executar na mesma evidência cada cadastro individual salvo e a inclusão na listagem tbm
    #podem ter diferentes SKU com o mesmo nome de produto


@manual
@tarefa_#:61001
@ajuste_#:62256
@manual-result:success
@manual-last-tested:24-10-2022
@manual-test-evidence:assets/A-novo-produto-campos-vazios-ou-invalidos-I.mp4,assets/A-novo-produto-campos-vazios-ou-invalidos-II.mp4,assets/A-novo-produto-campos-vazios-ou-invalidos-III.png
    Esquema do Cenário: Novo Produto - Campos vazios ou inválidos
        Dado que o admin está na tela da listagem de "Produtos"
        Quando acionar o botão "Novo Produto"
        Então o sistema redireciona para outra tela [ou exibe um modal] para o "Cadastro de Produto"
        Quando não preencher os campos "<SKU>", "<EAN>", "<Categoria>", "<Subcategoria>", "<Produto>" e "<Status>" ou preencher com valores inválidos
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações
        E exibe em cada campo o alerta conforme "<Resposta do sistema>"
        E não salva o produto, mantendo o admin na tela [ou modal] de cadastro
            Exemplos:
            | <SKU>       | <EAN>                     | <Categoria> | <Subcategoria>   | <Produto> | <Status> | <Resposta do sistema>                                                                  |
            |             |                           |             |                  |           | Ativo    | Alerta de preenchimento obrigatório em: SKU / EAN / Categoria / Subcategoria / Produto |
            |             | 1112223334567             | Fogão       | COOKTOP 5 bocas  | Teste B30 | Ativo    | Preencha este campo                                                                    |
            | SKU-01      |                           | Fogão       | COOKTOP 5 bocas  | Teste B31 | Ativo    | Preencha este campo                                                                    |
            | SKU-02      | 1112223334568             |             | COOKTOP 5 bocas  | Teste B32 | Ativo    | Selecione um item da lista                                                             |
            | SKU-03      | 1112223334569             | Fogão       |                  | Teste B33 | Ativo    | Selecione um item da lista                                                             |
            | SKU-04      | 1112223334560             | Forno       | FORNO DE BANCADA |           | Ativo    | Preencha este campo                                                                    |
            | 'duplicado' | 2223334445679             | Forno       | COOKTOP 5 bocas  | Teste B34 | Ativo    | Já existe um produto cadastrado com este SKU                                           |
            | SKU-06      | 'duplicado'               | Forno       | COOKTOP 5 bocas  | Teste B35 | Ativo    | Já existe um produto cadastrado com este EAN                                           |
            | SKU-06      | 'com menos de 13 dígitos' | Forno       | COOKTOP 5 bocas  | Teste B36 | Ativo    | O EAN deve conter 13 dígitos                                                           |
            | SKU-06      | 'com mais de 13 dígitos'  | Forno       | COOKTOP 5 bocas  | Teste B37 | Ativo    | Bloqueia a digitação com mais de 13 dígitos                                            |
#62256 - Está permitindo salvar EAN com menos de 13 dígitos.


@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-novo-produto-produto-com-nome-ja-existente.mp4
    Esquema do Cenário: Novo Produto - Produto com nome já existente
        Dado que já existe um produto de nome "Produto Teste QA" de SKU "SKU-123"
        Quando o admin realizar um cadastro de um novo produdo de SKU "SKU-456"
        Mas informar o mesmo nome "Produto Teste QA" 
        Então o produto será cadastrado normalmente, pois podemos ter o mesmo 'nome' para diferentes 'SKUs'


@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-editar-acessar-validar-layout-e-cancelar.mp4
    Cenário: Editar - Acessar, validar layout e Cancelar
        Dado que o admin está na tela da listagem de "Produtos"
        Quando acionar a opção "Editar" dentro de "Ações" na listagem de um produto
        Então o sistema exibe um modal [ou redireciona para outra tela] permitindo a edição individual do respectivo "Produto"
        E todos os campos são exibidos preenchidos conforme cadastro realizado
        Mas os campos "<SKU>" e "<EAN>" são exibidos somente para leitura, bloqueados para edição
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Produtos" 


@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-editar-editar-com-campos-vazios.mp4
    Cenário: Editar - Editar com campos vazios
        Dado que o admin está na edição de um "Produto"
        Quando remover os dados dos campos liberados para edição "Produto", "Categoria" e "Subcategoria"
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações
        E exibe em cada campo o alerta de preenchimento obrigatório
        E não altera o produto, mantendo o admin na tela [ou modal] de Edição


@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-editar-com-dados-validos-I.mp4,assets/A-editar-com-dados-validos-II.mp4
    Cenário: Editar - Editar com dados válidos
        Dado que o admin está na edição individual de um "Produto"
        Quando alterar o nome do "Produto"
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações
        E realiza a alteração do produto, listando-o na tela de produtos conforme a alteração realizada
        Quando alterar a "Categoria" para outra da listagem
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações
        E realiza a alteração do produto, listando-o na tela de produtos conforme a alteração realizada    
        Quando alterar a "Subcategoria" para outra da listagem
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações
        E realiza a alteração do produto, listando-o na tela de produtos conforme a alteração realizada
        Quando alterar o "Status"
        E acionar o botão "Salvar" 
        Então o sistema faz as devidas validações
        E realiza a alteração do produto, listando-o na tela de produtos conforme a alteração realizada


@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-editar-status-inativar-e-zerar-produto-existente-em-tabelas-I.mp4,assets/A-editar-status-inativar-e-zerar-produto-existente-em-tabelas-II.mp4
    Cenário: Editar Status - Inativar e Zerar produto existente em tabelas
        Dado que já existem algumas tabelas de pontos com o produto de SKU "SKU-123"
        Quando o admin alterar o status deste produto de Ativo para "Inativo"
        Então este produto ficará "INATIVO" em 'todas' as tabelas que o contém
        E as pontuações deste SKU "SKU-123" serão zeradas também em todas as tabelas que o contém para todos os perfis

@manual
@tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-editar-status-ativar-produto-existente-em-tabelas-I.mp4
    Cenário: Editar Status - Ativar produto existente em tabelas
        Dado que já existem tabelas de pontos com um produto que foi inativado, inativando assim este SKU em tds as tabelas
        Quando o admin alterar o status deste produto de Inativo para "Ativo"
        Então apenas o produto ficará ativo novamente
        Mas não vai alterar o status deste produto nas tabelas que o contém
        E o valor deste SKU não será atualizado/recuperado


@manual
@Tarefa_#:61001
@manual-result:success
@manual-last-tested:18-10-2022
@manual-test-evidence:assets/A-log-de-cadastro-e-edicao-em-BD-I.mp4,assets/A-log-de-cadastro-e-edicao-em-BD-II.mp4
    Cenário: Log de Cadastro e Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos: