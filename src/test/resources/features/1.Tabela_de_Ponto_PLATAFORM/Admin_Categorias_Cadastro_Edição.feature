#language: pt

Funcionalidade: Cadastro e Edição de Categorias
Como usuário administrador ativo na Plataforma
Quero acessar as Categorias da campanha
Para realizar cadastro e edições de Categorias na campanha

BD
SELECT * FROM account_campaign_department WHERE account_id = ;
-----

Critérios de Aceitação:
Acessado através do menu - Gerencial > Tabela de Pontuação > Categorias > Cadastrar
Exibir breadcrumb
Exibir apenas um campo para preenchimento obrigatório: "Categoria" 
Exibir dois botões: "Cancelar" e "Salvar"
Botão "Cancelar": interrompe e não não grava a ação e retorna à tela de listagem de categorias
Botão "Salvar" faz duas validações: 
    - Preenchimento do campo é obrigatório: "preencha este campo"
    - Não permitir duplicidade de nomes de categorias para a mesma campanha: "Já existe uma categoria cadastrada com esse nome."
Botão "Salvar": Grava a categoria e retorna à tela de listagem de categorias
Edição acessar através da opção "Editar" dentro de "Ações" na listagem de Categorias
Na edição o campo vem preenchido conforme cadastro
Na edição mantém as duas validações: 
    - Preenchimento do campo é obrigatório: "preencha este campo"
    - Não permitir duplicidade de nomes de categorias para a mesma campanha: "Já existe uma categoria cadastrada com esse nome."
Na edição trazer o ID da respectiva categoria na url
Na edição não permitir alterar o ID de outra campanha trocando via url #verificar comportamento, ou cria uma nova na campanha logada ou redireciona para a home


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_cadastrar-categoria-acessar-validar-layout-e-cancelar.mp4)
Cenário: Cadastrar Categoria - Acessar, validar layout e Cancelar
    Dado que o admin está na tela da listagem de "Categorias"
    Quando acioanr o botão "Cadastrar"
    Então o sistema redireciona para a tela de "Cadastro"
    Quando o usuário visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
    Quando o admin acionar o botão "Cancelar"
    Então o sistema redireciona o admin de volta para a listagem de "Categorias"


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_cadastrar-categoria-dados-válidos.mp4)
Cenário: Cadastrar Categoria - Dados válidos
    Dado que o admin está na tela de cadastro de "Categorias"
    Quando preencher o campo "Categoria" com nome único nesta campanha
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Categoria cadastrada com sucesso"
    E redireciona o admin de volta para a listagem de "Categorias"
    E exibirá essa categoria recém cadastrada na listagem de "Categorias"


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_cadastrar-categoria-dados-inválidos-ou-vazio.mp4)
Esquema do Cenário: Cadastrar Categoria - Dados inválidos ou vazio
    Dado que o admin está na tela da listagem de "Categorias"
    Quando preencher o campo "<Categoria>" com nome já existente para a campanha ou não preencher o campo
    E acionar o botão "Salvar"
    Então o sistema exibe a "<Mensagem do sistema>"
    E não realiza nenhum cadastro, mantendo o admin na tela de cadastro
    Exemplos:
    | <Categoria>         | <Resposta do sistema>                           |
    | 'nome já existente' | Já existe uma categoria cadastrada com esse nome|
    | 'deixar vazio'      | O valor é obrigatório e não pode estar vazio.   |


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-categoria-acessar-validar-layout-e-cancelar.mp4)
Cenário: Editar Categoria - Acessar, validar layout e Cancelar
    Dado que o admin está na tela da listagem de "Categorias"
    Quando acionar botão "Ações" de uma categoria da listagem
    E acionar a opção "Editar"
    Então o sistema redireciona o admin para a tela de "Edição da Categoria" exibindo o ID da respectiva categoria na url
    E com o campo "Categoria" já virá preenchido conforme cadastro
    Quando o admin acionar o botão "Cancelar"
    Então o sistema redireciona o admin de volta para a listagem de "Categorias"
    E não realiza nenhuma alteração


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-categoria-dados-inválidos-ou-vazio.mp4)
Esquema do Cenário: Editar Categoria - Dados inválidos ou vazio
    Dado que o admin está na tela de "Edição da Categoria" 
    Quando alterar o campo "<Categoria>" com nome já existente para a campanha ou não preencher o campo
    E acionar o botão "Salvar"
    Então o sistema exibe a "<Mensagem do sistema>"
    E não realiza nenhuma alteração, mantendo o admin na tela de edição
    Exemplos:
    | <Categoria>         | <Resposta do sistema>                           |
    | 'nome já existente' | Já existe uma categoria cadastrada com esse nome|
    | 'deixar vazio'      | O valor é obrigatório e não pode estar vazio.   |


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-categoria-dados-válidos.mp4)
Cenário: Editar Categoria - Dados válidos
    Dado que o admin está na tela de "Edição da Categoria" 
    Quando alterar o nome no campo "<Categoria>" com nome único na campanha
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso"
    E redireciona o admin de volta para a listagem de "Revendas"
    E o nome da respectiva "Categoria" será exibido na listagem atualizado


@manual
@tarefa_#60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-categoria-alterar-id-de-outra-campanha-trocando-o-id-via-url.mp4)
Cenário: Editar Categoria - Alterar ID de outra campanha trocando o ID via url
    Dado que o admin está na tela de "Edição da Categoria" desta campanha
    Quando alterar o ID na url para o ID de outra campanha
    E dar enter
    Então o sistema exibe a tela de cadastro com o campo de "Categoria" vazio
    Quando preencher uma nova categoria
    E acionar o botão "Salvar"
    Então o sistema cadastrada uma nova categoria desta campanha com um novo ID
    Mas não altera o ID/Categoria da outra campanha


@manual
@Tarefa_#:60626
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_log-de-cadastro-e-edição-em-bd.mp4)
    Cenário: Log de Cadastro e Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos:

#8CN