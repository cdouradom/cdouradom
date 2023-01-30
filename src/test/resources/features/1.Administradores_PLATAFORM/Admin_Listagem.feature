#language: pt

Funcionalidade: Admin - Listagem de Administradores
    Como administrador da Plataforma
    Quero acessar a tela de Administradores
    Para visualizar todos os Administradores dessa campanha

    -----

    Critérios de Aceitação:
    Exibir todos os Administradores cadastrados nessa campanha
    Não visualizar Administradores de outras campanhas
    Disponibilizar opção "Aterar" em cada administrador da listagem
    Disponibilizar botão "Cadastrar" para acessar tela para cadastro de novo administrador

    ---

    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_listagem-de-administradores-acesso-e-layout.mp4)
    Cenário: Listagem de Administradores - Acesso e Layout
        Dado que o admin está logado na Plataforma da campanha
        Quando o admin acionar o menu principal
        E acionar o menu "Gerencial"
        Então serão demonstrados os submenus disponíveis, entre eles: "Administradores"
        Quando o admin acionar o submenu "Administradores"
        Então o sistema redireciona o admin para a url ".../Plataform/User/index", sendo a listagem de Administradores
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs                | Gerencial/Administradores                                       |
            | Qnt registros              | Foram encontrados 'x' registros                                 |
            | Botão "Cadastrar"          | Com url da tela de cadastro                                     |
            | Gride - Cabeçalho          | Login, Nome, Perfil, Status, Ações                              |
            | Gride - Listagem           | Informações respectivas ao cabeçalho, Ações: Alterar            |
            | Botão "Exportar Registros" | Download do arquivo excel                                       |



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_listagem-de-administradores-abrir-ações.mp4)
    Cenário: Listagem de Administradores - Abrir Ações
        Dado que o admin está na tela de "Administradores"
        E existe um administrador na listagem
        Quando acionar o botão "Ações"
        Então será demonstrada a opção "Alterar"



    @manual
    @Tarefa_#60473
    @Sugestão_#60684
    @manual-result:success
    @manual-last-tested:07-10-2022
    @manual-test-evidence:[Evidência](assets/A_edição-de-administrador-alterar-os-dados_v2.mp4)
    Cenário: Listagem de Administradores - Acionar opção Alterar
        Dado que o admin está na tela de "Administradores"
        E acionou o botão "Ações"
        Quando acionar a opção "Alterar" dentro de Ações
        Então o sistema redireciona o admin para a tela de "Edição" de url ".../Plataform/User/save/****"
        E o ID deste administrador será evidenciado no final da url "***" da tela
        Mas os campos "Login" e "Perfil" não podem ser alterados



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_listagem-de-administradores-acionar-botão-cadastrar.mp4)
    Cenário: Listagem de Administradores - Acionar botão Cadastrar
        Dado que o admin está na tela de "Administradores"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro" de url ".../Plataform/User/save"



@manual
@Tarefa_#60473
@Ajuste_#60685
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_listagem-de-administradores-exportar-registros-v2.mp4)
    Cenário: Listagem de Administradores - Exportar Registros
    Dado que o admin está na tela de "Administradores"
    Quando acionar o botão "Exportar Registros"
    Então o "Relatório de Administradores" será baixado na extensão .xlsx conforme modelo requerido
    E todos os adminstrados desta campanha irão compor o arquivo com as informações "Login", "Nome", "Perfil", "Cargo" e "Status"


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_listagem-de-administradores-paginação-e-transição.mp4)
    Cenário: Listagem de Administradores - Paginação e transição
        Dado que o admin esta na listagem de "Administradores"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros


#5 CN
