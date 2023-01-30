#language: pt

Funcionalidade: Cadastro e Edição de Categorias
Como usuário administrador ativo na Plataforma
Quero acessar o cadasro de Subcategorias da campanha
Para realizar novos cadastro e edições

BD
SELECT * FROM account_campaign_department WHERE account_id = ;
OBS: parent_id é o relacionamento da sub com a categoria
-----

Critérios de Aceitação:
Acessado através do menu - Gerencial > Tabela de Pontuação > Subcategorias > Cadastrar
Exibir breadcrumb
Exibir dois campos de preenchimento obrigatório: "Categoria" e "Subcategorias"
Exibir no campo "Categoria" uma lista suspensa com todas as categorias desta campanha
Exibir dois botões: "Cancelar" e "Salvar"
Botão "Cancelar": interrompe e não não grava a ação e retorna à tela de listagem de categorias
Botão "Salvar" faz duas validações: 
    - Preenchimento dos campos são obrigatórios: "preencha este campo"
    - Não permitir duplicidade de nomes de subcategorias para a mesma campanha: "Já existe uma subcategoria cadastrada com esse nome."
Botão "Salvar": Grava a subcategoria e retorna à tela de listagem de subcategoria
Edição acessar através da opção "Editar" dentro de "Ações" na listagem de subcategorias
Na edição os campos vem preenchidos conforme cadastro
Na edição mantém as duas validações: 
    - Preenchimento dos campos são obrigatórios: "preencha este campo"
    - Não permitir duplicidade de nomes de subcategorias para a mesma campanha, independente de serem de diferentes categorias: "Já existe uma categoria cadastrada com esse nome."
Na edição trazer o ID da respectiva subcategoria na url
Na edição o campo "Categoria" não fica disponível para alteração
Na edição não permitir alterar o ID de outra campanha trocando via url #verificar comportamento, ou cria uma nova na campanha logada ou redireciona para a home

---

@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_cadastrar-subcategoria-acessar-validar-layout-e-cancelar.mp4)
Cenário: Cadastrar Subcategoria - Acessar, validar layout e Cancelar
    Dado que o admin está na tela da listagem de "Subcategorias"
    Quando acioanr o botão "Cadastrar"
    Então o sistema redireciona para a tela de "Cadastro"
    Quando o usuário visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
    Quando o admin acionar o botão "Cancelar"
    Então o sistema redireciona o admin de volta para a listagem de "Subcategorias"


@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_cadastrar-subcategoria-dados-válidos.mp4)
Cenário: Cadastrar Subcategoria - Dados válidos
    Dado que o admin está na tela de cadastro de "Subcategorias"
    Quando selecionar uma opção da lista suspensa "Categoria"
    E preencher o campo "Subcategoria" com nome único nesta campanha
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Subcategoria cadastrada com sucesso"
    E redireciona o admin de volta para a listagem de "subcategorias"
    E exibirá essa subcategoria recém cadastrada na listagem de "subcategorias"


@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_cadastrar-subcategoria-dados-inválidos-ou-vazio.mp4)
Esquema do Cenário: Cadastrar Subcategoria - Dados inválidos ou vazio
    Dado que o admin está na tela da listagem de "Subcategorias"
    Quando não selecionar uma "<Categoria>" da lista, deixando o campo vazio
    E /ou preencher o campo "<Subcategoria>" com nome já existente para a campanha ou não preencher este campo
    E acionar o botão "Salvar"
    Então o sistema exibe a "<Mensagem do sistema>"
    E não realiza nenhum cadastro, mantendo o admin na tela de cadastro
    Exemplos:
    | <Categoria>         | <Subcategoria>         | <Resposta do sistema>                               |
    | 'da lista'          | 'já existente'         | Já existe uma subcategoria cadastrada com esse nome |
    | 'deixar vazio'      | 'deixar vazio'         | O valor é obrigatório e não pode estar vazio        |
    | 'da lista'          | 'deixar vazio'         | O valor é obrigatório e não pode estar vazio        |
    | 'deixar vazio'      | 'Sub Teste'            | Selecione uma categoria                             |



@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-subcategoria-acessar-validar-layout-e-cancelar.mp4)
Cenário: Editar Subcategoria - Acessar, validar layout e Cancelar
    Dado que o admin está na tela da listagem de "Subcategorias"
    Quando acionar botão "Ações" de uma subcategoria da listagem
    E acionar a opção "Editar"
    Então o sistema redireciona o admin para a tela de "Edição da Subcategoria" exibindo o ID da respectiva subcategoria na url
    E com os campos "Categoria" e "Subcategoria" já virão preenchido conforme cadastro
    Quando o admin acionar o botão "Cancelar"
    Então o sistema redireciona o admin de volta para a listagem de "Subcategoria"
    E não realiza nenhuma alteração


@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-subcategoria-dados-inválidos-ou-vazio.mp4)
Esquema do Cenário: Editar Subcategoria - Dados inválidos ou vazio
    Dado que o admin está na tela de "Edição da Subcategoria" 
    Quando alterar o campo "Subcategoria" com nome já existente para a campanha ou não preencher o campo
    E acionar o botão "Salvar"
    Então o sistema exibe a "<Mensagem do sistema>"
    E não realiza nenhuma alteração, mantendo o admin na tela de edição
    Exemplos:
            | <Categoria> | <Subcategoria> | <Resposta do sistema>                               |
            | 'da lista'  | 'já existente' | Já existe uma subcategoria cadastrada com esse nome |
            | 'da lista'  | 'deixar vazio' | O valor é obrigatório e não pode estar vazio        |
            


@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-subcategoria-dados-válidos.mp4)
Cenário: Editar Subcategoria - Dados válidos
    Dado que o admin está na tela de "Edição da Subcategoria" 
    Quando alterar o nome no campo "Subcategoria" com nome único na campanha
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso"
    E redireciona o admin de volta para a listagem de "Subcategorias"
    E o nome da respectiva "Subcategoria" será exibido na listagem atualizado, conforme alteração
    


@manual
@tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_editar-subcategoria-alterar-id-de-outra-campanha-trocando-o-id-via-url.mp4)
Cenário: Editar Subcategoria - Alterar ID de outra campanha trocando o ID via url
    Dado que o admin está na tela de "Edição da Subcategoria" desta campanha
    Quando alterar o ID na url para o ID de outra campanha
    E dar enter
    Então o sistema exibe a tela de cadastro com os campos "Categoria" e "Subcategoria" vazios
    Quando o admin preencher esses campos
    E acionar o botão "Salvar"
    Então o sistema cadastrada uma nova "Subcategoria" nesta campanha com um novo ID
    Mas não altera o ID/Subcategoria da outra campanha

 
@manual
@Tarefa_#60995
@manual-result:success
@manual-last-tested:06-10-2022
@manual-test-evidence:[Evidência](assets/A_log-de-cadastro-e-edição-em-bd-subcategoria.mp4)
    Cenário: Log de Cadastro e Edição em BD 
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos