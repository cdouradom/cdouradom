#language: pt

Funcionalidade: Admin - Cadastro e Edição de Administradores
    Como administrador da Plataforma
    Quero me cadastrar
    Para ter acesso a Plataforma

    -----

    Critérios de Aceitação:
    Os campos obrigatórios são Nome, Login, Status, Perfil, Senha e Confirmar Senha
    Não é permitido login duplicado para diferente Administradores
    Não é permitido email duplicado para diferente Administradores
    O Admin Aiwa Cliente é limitado e não tem acesso ao o gerenciamento de hierarquias e nem a importação e aprovação de Sell out

    ---

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:30-09-2022
    @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-acessar-layout-e-cancelar.mp4)
    Cenário: Cadastro de Administrador - Acessar, Layout e Cancelar
        Dado que o admin está na tela de "Administradores"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro" de url ".../Plataform/User/save"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs           | com redirecionamento ao clique                            |
            | Input Nome            | Campo obrigatório                                         |
            | Input E-mail          | Campo opcional                                            |
            | Input Cargo           | Campo opcional                                            |
            | Input Login           | Campo obrigatório                                         |
            | Select Status         | Campo obrigatório - Opções Ativo e Inativo                |
            | Select Perfil         | Campo obrigatório - Opções Admin Fischer e Admin Proponto |
            | Input Senha           | Campo obrigatório alfanumérico com no mínimo de 8 dígitos |
            | Input Confirmar Senha | Campo obrigatório alfanumérico com no mínimo de 8 dígitos |
            | Botões de ação        | "Cancelar" e "Salvar"                                     |
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Administradores"
        E interrompe o cadastro do Administrador



    @manual
        @Tarefa_#60473
        @manual-result:success
        @manual-last-tested:30-09-2022
        @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-com-dados-obrigatórios-não-preenchidos.mp4)
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
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:30-09-2022
    @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-apenas-com-dados-obrigatórios-preenchidos.mp4)
    Cenário: Cadastro de Administrador - Apenas com dados obrigatórios preenchidos
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher somente os campos obrigatórios: "Nome", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário salvo com sucesso"
        E redireciona o admin para a listagem
        E exibe esse novo usuário na listagem



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:30-09-2022
    @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-dados-obrigatórios-e-opcionais-preenchidos.mp4)
    Cenário: Cadastro de Administrador - Dados obrigatórios e opcionais preenchidos
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher os campos "Nome", "E-mail", "Cargo", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário salvo com sucesso"
        E redireciona o admin para a listagem
        E exibe esse novo usuário na listagem



    @manual
    @Tarefa_#60473
    @Sugestão_#60673
    @manual-result:success
    @manual-last-tested:07-10-2022
    @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-usuários-diferentes-com-o-mesmo-e-mail_v2.mp4)
    Cenário: Cadastro de Administrador - Usuários diferentes com o mesmo e-mail
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher os campos "Nome", "E-mail", "Cargo", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        Mas no campo "E-mail" informar um e-mail já cadastrado para outro usuário admin
        E acionar o botão "Salvar"
        Então o sistema não realiza o cadastro
        E exibe uma mensagem "Não pode haver duplicidade de email" ou algo similar



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:30-09-2022
    @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-usuários-diferentes-com-o-mesmo-login.mp4)
    Cenário: Cadastro de Administrador - Usuários diferentes com o mesmo Login
        Dado que o admin está na tela para "Cadastro de Administradores"
        Quando preencher os campos "Nome", "E-mail", "Cargo", "Login", "Status", "Perfil", "Senha" e "Confirmar Senha"
        Mas no campo "Login" informar um login já cadastrado com outro usuário admin
        E acionar o botão "Salvar"
        Então o sistema não realiza o cadastro
        E exibe uma mensagem "Login já cadastrado" ou algo similar

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_cadastro-de-administrador-visão-de-cada-perfil-admin.mp4)
    Cenário: Cadastro de Administrador - Visão de cada perfil admin
        Dado os seguintes dados
            | Admin 1 | Admin Aiwa Cliente  |
            | Admin 2 | Admin Aiwa Próponto |
        Quando os "Admin 1" e "Admin 2" logar na Plataforma
        Então ambos os perfis de admin tem a mesma visão na plataforma

    @manual
    @Tarefa_#60473
    @Sugestão_#60684
    @manual-result:success
    @manual-last-tested:07-10-2022
    @manual-test-evidence:[Evidência](assets/A_edição-de-administrador-alterar-os-dados_v2.mp4)
    Cenário: Edição de Administrador - Alterar os dados
        Dado que o admin aciona a opção "Alterar" dentro de Ações
        Quando alterar os dados dos campos passíveis de edição #os campos “Login” e “Perfil” não podem ser alterados - validado em outro cenário da feature Admin Listagem
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário salvo com sucesso"
        E redireciona o admin para a listagem

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_edição-de-administrador-alterar-e-cancelar.mp4)
    Cenário: Edição de Administrador - Alterar e Cancelar
        Dado que o admin aciona a opção "Alterar" dentro de Ações
        E o sistema redireciona para o formulário exibindo todos os dados deste respectivo usuário admin
        E trazendo na Url o ID deste usuário admin
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin para a listagem de "Administradores"
        E interrompe a alteração do Administrador


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_edição-de-administrador-alterando-o-status-para-inativo.mp4)
    Cenário: Edição de Administrador - Alterando o Status para Inativo
        Dado que o admin aciona a opção "Alterar" dentro de Ações
        Quando alterar os dados do campo "Status" para "Inativo"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de sucesso com a mensagem "Usuário salvo com sucesso"
        E redireciona o admin para a listagem
        Então quando o respectivo usuário tentar logar o sistema exibirá a mensagem "Login ou Senha Inválidos"

    @manual
    @Tarefa_#60473
    @manual-result: #ver
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
