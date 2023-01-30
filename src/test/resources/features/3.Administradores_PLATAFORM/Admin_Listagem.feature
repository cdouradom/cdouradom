#language: pt

Funcionalidade: Admin - Listagem de Administradores
    Como administrador da Plataforma
    Quero acessar a tela de Administradores
    Para visualizar todos os Administradores dessa campanha

    BD 
    SELECT * FROM `user` WHERE account_id = 'IDCampanha';
    #localizar admins por campanha
    -----

Critérios de Aceitação:
Exibir todos os Administradores cadastrados nessa campanha
Não visualizar Administradores de outras campanhas
Disponibilizar opção "Aterar" em cada administrador da listagem
Disponibilizar botão "Cadastrar" para acessar tela para cadastro de novo administrador

    ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
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
            | Botão "Cadastrar"          | Com url da tela de cadastro                                     |
<<<<<<< HEAD
            | Filtro                     | 'Login', 'Nome', 'Perfil' e 'Status'                            |
            | Botão "Buscar"             | realizar a busca                                                |
            | Gride - Cabeçalho          | Login, Nome, Perfil, Status, Ações                              |
            | Gride - Listagem           | Informações respectivas ao cabeçalho, Ações: Alterar            |
            | Qnt registros              | Foram encontrados 'x' registros                                 |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Administradores - Abrir Ações
        Dado que o admin está na tela de "Administradores"
        E existe um administrador na listagem
        Quando acionar o botão "Ações"
        Então será demonstrada a opção "Alterar"
=======
            | Gride - Filtros            | Login, Nome, Perfil, Status e Botão Buscar                      |
            | Gride - Listagem           | Avatar, Login, Nome, Perfil, Status e Ações: Alterar            |
            | Botão "Exportar"           | Download do arquivo excel                                       |
            | Qnt registros              | Foram encontrados 'x' registros                                 |
>>>>>>> main


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Administradores - Acionar opção Alterar
        Dado que o admin está na tela de "Administradores"
        E acionou o botão "Ações"
        Quando acionar a opção "Alterar" 
        Então o sistema redireciona o admin para a tela de "Edição" de url ".../Plataform/User/save/****"
        E o ID deste administrador será evidenciado no final da url "***" da tela
<<<<<<< HEAD
        Mas o campo "Login"  não pode ser alterado
=======
        Mas o campo "Login" não pode ser alterado
>>>>>>> main



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Listagem de Administradores - Acionar botão Cadastrar
        Dado que o admin está na tela de "Administradores"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro" de url ".../Plataform/User/save"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
<<<<<<< HEAD
=======
    Cenário: Listagem de Administradores - Exportar
    Dado que o admin está na tela de "Administradores"
    Quando acionar o botão "Exportar"
    Então o "Relatório de Administradores" será baixado na extensão .xlsx conforme modelo requerido
    E todos os adminstrados desta campanha irão compor o arquivo com as informações "ID", "Login", "Nome", "Perfil", e "Status"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
>>>>>>> main
    Cenário: Listagem de Administradores - Paginação e transição
        Dado que o admin esta na listagem de "Administradores"
        Quando a quantidade de registros ultrapassar 20 linhas
        Então deve-se gerar paginação
        Quando o admin acionar a transição de páginas
        Então o sistema irá redirecionar para as outras páginas exibindo os dados de cadas respectiva página sem apresentar erros


#5 CN
