#language: pt

Funcionalidade: Admin - Dashboard
    Como admin administrador ativo na Plataforma
    Quero acessar a módulos de Dashboard
    Para fazer novos cadastros e edições
    Para disponibilizá-los no meu principal do admin


    Critérios de Aceitação:
    O cadastro de dashboard é acessado através do menu Gerencial
    Na listagem de dashboard é exibido o ID, o Título e um botão Ações com as opções Edita e Excluir
    Os campos Título e link são de preenchimento obrigatório no cadastro
    Após o cadastro de um dashboard é preciso fazer novo login para visualizá-lo no menu principal
    Os dashboards cadastradas são listado no menu adicional/principal Dashboard

    ---

    @manual
    @Tarefa_#
    @manual-result:
    @manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Dashboard - Acessar e Layout
        Dado que o admin acessou a tela "Dashboard" no menu Gerencial
        Quando o admin visualizar todos os elementos da tela
        E não houverem dashs cadastrados
        Então os elementos da tela estão alinhados corretamente
        E a listagem será vazia com o texto "Nenhum registro encontrado."
        Quando houverem dashs cadastrados
        Então os elementos da tela estão alinhados corretamente
        E a listagem será exibida



    @manual
    @Tarefa_#
    @manual-result:
    @manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Dashboard - Botão Cadastrar e Cancelar
        Dado que o admin acessou a tela "Dashboard"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona para a tela de cadastro com os campos "Título*" e "URL*"
        E os botões "Voltar" e "Salvar"
        Quando acionar o botão "Voltar"
        Então o sistema redireciona para a listagem de Dashboard



    @manual
    @Tarefa_#
    @manual-result:
    @manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Cadastrar Dashboard - Campos vazios
        Dado que o admin acessou a tela "Dashboard"
        Quando acionar o botão "Cadastrar"
        Mas não preencher os campos "Título" e "Link"
        Então o sistema vai exibir a mensagem "Preencha este campo" em cada campo


    @manual
    @Tarefa_#
    @manual-result:
    @manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Cadastrar Dashboard
        Dado que o admin acessou a tela "Dashboard"
        Quando preencher o "Título" e inserir no "Link" um iframe do Power BI
        E acionar o botão "Salvar"
        Então o sistema efetiva o cadastro
        E redireciona o admin de volta para a listagem
        E após realizar novo login no admin adiciona um novo menu principal "Dashboard"
        E lista o(s) título(s) como submenu(s) neste menu principal
        Quando o admin clicar em um submenu
        Então o sistmea exibe o Dashboard BI dentro da Plataforma


@manual
    @Tarefa_#
    @manual-result:
    @manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Dashboard - Alterar
        Dado que o admin está na listagem de Dashboard
        Quando acionar o botão "Ações"
        Então serão listadas as opções "Alterar" e "Excluir"
        Quando acionar a opção "Alterar"
        Então o sistema redireciona para o dashboard cadastrado
        E os campos "Título" e "Link" podem ser editados
        Quando o admin alterar os campos ou não
        E acionar o botão "Salvar"
        Então o sistema efetiva a alteração
        E redireciona o admin de volta para a listagem


    @manual
    @Tarefa_#
    @manual-result:
    @manual-last-tested:
    @manual-test-evidence:[Evidência]
    Cenário: Dashboard - Excluir
        Dado que o admin está na listagem de Dashboard
        Quando acionar o botão "Ações"
        Então serão listadas as opções "Alterar" e "Excluir"
        Quando acionar a opção "Excluir"
        Então o sistema exclui o Dashboard da campanha 
        E recarrega a tela exibindo o modal de sucesso
        E remove da listagem
        E não lista mais no menu principal de "Dashboard"

    
#6 CN
