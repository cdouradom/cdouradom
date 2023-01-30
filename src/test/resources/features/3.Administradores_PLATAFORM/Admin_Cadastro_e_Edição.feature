#language: pt

Funcionalidade: Admin - Cadastro e Edição de Administradores
    Como administrador da Plataforma
    Quero me cadastrar
    Para ter acesso a Plataforma

    BD 
    SELECT * FROM `user` WHERE account_id = 'IDCampanha';
    #localizar admins por campanha

    -----

Critérios de Aceitação:
Os campos obrigatórios são Nome, Login, Status, Perfil, Senha e Confirmar Senha
Não é permitido login duplicado para diferentes Administradores
Não é permitido email duplicado para diferentes Administradores

    ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Administrador - Acessar, Layout e Cancelar
        Dado que o admin está na tela de "Administradores"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro" de url ".../Plataform/User/save"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs           | com redirecionamento ao clique                            |
<<<<<<< HEAD
            | Imagem                | Campo opcional
=======
            | Input Imagem          | Campo opcional                                            |
>>>>>>> main
            | Input Nome            | Campo obrigatório                                         |
            | Input E-mail          | Campo opcional                                            |
            | Input Login           | Campo obrigatório                                         |
            | Select Status         | Campo obrigatório - Opções Ativo e Inativo                |
            | Select Perfil         | Campo obrigatório - Opções Admin Proponto e Admin Cliente |
            | Input Senha           | Campo obrigatório alfanumérico com no mínimo de 8 dígitos |
            | Input Confirmar Senha | Campo obrigatório alfanumérico com no mínimo de 8 dígitos |
            | Botões de ação        | "Voltar" e "Salvar"                                     |
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Administradores"
        E interrompe o cadastro do Administrador



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Cadastro de Administrador - Com dados obrigatórios não preenchidos
        Dado que o admin acessou a tela para "Cadastro de Administradores"
        Quando não preencher os campos obrigatórios
        E acionar o botão "Salvar"
        Então o sistema exibe "<Mensagem do sistema>"
        E não faz o cadastro do Administrador
        E o admin permanece na mesma tela de cadastro
        Exemplos:
            | Nome  | Login       | Status | Perfil | Senha    | Confirmar Senha | Mensagem do sistema        |
            |       |             |        |        |          |                 | Preencha este campo        |
            |       | teste.teste | Teste  | Teste  | ******** | ********        | Preencha este campo        |
            | Teste |             | Teste  | Teste  | ******** | ********        | Preencha este campo        |
            | Teste | teste.teste |        | Teste  | ******** | ********        | Selecione um item da lista |
            | Teste | teste.teste | Teste  |        | ******** | ********        | Selecione um item da lista |
            | Teste | teste.teste | Teste  | Teste  |          | ********        | As senhas não estão iguais |
            | Teste | teste.teste | Teste  | Teste  | ******** |                 | As senhas não estão iguais |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Administrador - Apenas com dados obrigatórios preenchidos
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher somente os campos obrigatórios: "Nome", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário criado com sucesso!"
        E redireciona o admin para a listagem
        E exibe esse novo usuário na listagem



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Administrador - Dados obrigatórios e opcionais preenchidos
        Dado que o admin está na tela para "Cadastro de Administradores"
<<<<<<< HEAD
        Quando preencher os campos "Imagem", "Nome", "E-mail", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
=======
        Quando preencher os campos "Nome", "E-mail", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
>>>>>>> main
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário criado com sucesso!"
        E redireciona o admin para a listagem
        E exibe esse novo usuário na listagem



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Administrador - Usuários diferentes com o mesmo e-mail
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher os campos "Nome", "E-mail", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        Mas no campo "E-mail" informar um e-mail já cadastrado para outro usuário admin
        E acionar o botão "Salvar"
        Então o sistema não realiza o cadastro
<<<<<<< HEAD
        E exibe uma mensagem "E-mail já cadastrado" 
=======
        E exibe uma mensagem "Email já cadastrado" ou algo similar
>>>>>>> main



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Administrador - Usuários diferentes com o mesmo Login
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher os campos "Nome", "E-mail", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        Mas no campo "Login" informar um login já cadastrado com outro usuário admin
        E acionar o botão "Salvar"
        Então o sistema não realiza o cadastro
        E exibe uma mensagem "Login já cadastrado"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro de Administrador - Visão de cada perfil admin
        Dado os seguintes dados
            | Admin 1 | Admin Cliente  |
            | Admin 2 | Admin Próponto |
        Quando os "Admin 1" e "Admin 2" logar na Plataforma
        Então ambos os perfis de admin tem a mesma visão na plataforma ou poser que o admin cliente tenha algumas litiações 
            #porem isso deve ser cadastrado via acl 
            #no futuro isso poderá ser configurado na criação de campanha padrão 

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Edição de Administrador - Alterar os dados
        Dado que o admin aciona a opção "Alterar" dentro de Ações
<<<<<<< HEAD
        Quando alterar os dados dos campos passíveis de edição #o campo “Login”  não pode ser alterado - validado em outro cenário da feature Admin Listagem
=======
        Quando alterar os dados dos campos passíveis de edição #o campo “Login” não pode ser alterado
>>>>>>> main
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário atualizado com sucesso!"
        E redireciona o admin para a listagem


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Edição de Administrador - Alterar e Cancelar
        Dado que o admin aciona a opção "Alterar" dentro de Ações
        E o sistema redireciona para o formulário exibindo todos os dados deste respectivo usuário admin
        E trazendo na Url o ID deste usuário admin
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Administradores"
        E interrompe a alteração do Administrador


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Edição de Administrador - Alterando o Status para Inativo
        Dado que o admin aciona a opção "Alterar" dentro de Ações
        Quando alterar os dados do campo "Status" para "Inativo"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário atualizado com sucesso!"
        E redireciona o admin para a listagem
        Então quando o respectivo usuário tentar logar o sistema exibirá a mensagem "Login ou Senha Inválidos"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Log de Cadastro e Edição em BD
        Dado que o admin cadastrou e/ou editou um registro
        Quando consultar a tabela 'log' no BD
        Então toda ação será registrada na tabela com as infos:
            | ID (registro do banco)                   |
            | Ação executada (cadastro, alteração etc.)|
            | Campo (Nome, Status etc.);               |
            | logs de exclusão de Administrador        |
            | Data e hora do cadastro e/ou alterações  |
            | admin que cadastrou e/ou alterou/excluiu |
            | IP do computador do admin que fez a ação |

#11 CN