#language: pt

Funcionalidade: Admin - Cadastro e Edição de Pop Ups
Como usuário administrador ativo na Plataforma
Quero acessar a tela de de Pop Ups
Para realizar cadastro e edições dos Pop Ups da campanha

-----

Critérios de Aceitação:
Acesso através da listagem de Pop Ups
No formulário de cadastro - Exibir breadcrumb: "Gerencial / Pop Up / Cadastro"
No formulário de cadastro - Os campos que compõem a seção 'Dados' de preenchimento obrigatório são: "Título" , "Conteúdo", "Tela", "Frequência", "Mensagem de Confirmação", "Ação Positiva" e "Ação Negativa"
No formulário de cadastro - Os campos que compõem a seção 'Dados' com preenchimento opcional são: "Data Inicial" e "Data Final" #Informar data e hora
No formulário de cadastro - Exibir os botões: "Cancelar" e "Salvar"
No select "Tela" listar as opções: "Home", "Alterar Senha", "Biblioteca", "Campanhas", "Extrato de Pontos", "Meus Dados", "Meus Pedidos", "Notícias", "Notificações", "Regulamento" e "Treinamentos"
No select "Frequência" listar as opções: "Confirmação", "Sempre", "Todo Login", "Todo Dia", "Uma Vez", "Ação Positiva" e "Confirmação"
No formulário de cadastro  - Botão "Cancelar" interrompe e não realiza o cadastro e redireciona para a listagem de Pop Ups
No formulário de cadastro  - Botão "Salvar" faz as validações em todos os campos e retorna com as críticas necessárias
No formulário de cadastro  - Botão "Salvar" quando não existem críticas, realiza o cadastro respectiva campanha e redireciona para a listagem de Pop Ups
Edição acessar através da opção "Editar" dentro de "Ações" na listagem de Pop Ups
Na edição - todos os campos vem preenchidos conforme cadastrado
Na edição - Todos os campos são editáveis, mas o botão "Salvar" estará disponível se o Pop Up estiver com a data inicial futura ou ainda não foi visualizado
Na edição - Ao alterar alguma informação e salvar, as informações do pop up são atualizadas
Na edição - Todas as regras de cadastro precisam ser validadas novamente.

-----

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro - Acessar, validar Layout e Cancelar
        Dado que o admin esta na tela de "Pop Ups"
        Quando acionar o botão "Cadastrar"
        Então o sistema redireciona o admin para a tela de "Cadastro de Pop Ups"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Pop Ups"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro - Campos obrigatórios não preenchidos
        Dado que o admin esta na tela de "Cadastro de Pop Ups"
        Quando Não preencher os campos obrigatórios "Título" , "Conteúdo", "Tela", "Frequência", "Mensagem de Confirmação", "Ação Positiva" e "Ação Negativa"
        E acionar o botão "Salvar"
        Então o sistema alerta a obrigatoriedade de cada campo conforme "<Resposta do sistema>"
        Exemplos:
            | Título                  | Preencha este campo         |
            | Conteúdo                | Modal: Conteúdo Obrigatório |
            | Mensagem de Confirmação | Preencha este Campo         |
            | Ação Positiva           | Preencha este Campo         |
            | Ação Negativa           | Preencha este Campo         |
            #Os campos Tela e Frequência já vem preenchidos com a primeira opção da lista do select
            #O campo Mensagem de Confirmação está vinculado e só será habilidado quando a frequência Confirmação é selecionada


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro - Campo Conteúdo
        Dado que o admin está na tela de "Cadastro de Pop Ups" no campo Conteúdo
        Quando inserir opções que constam no CKEditor
        E acionar o botão "Salvar"
        Então o sistema deverá salvar a formatação e os itens selecionados


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Cadastro - Todas as informações preenchidas
        Dado que o admin está na tela de "Cadastro de Pop Ups"
        Quando for informado todos os campos 
        E clicar no botão "Salvar"
        Então o sistema	registra as informações 
        E redireciona o admin para a tela de listagem de Pop Ups


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Acesso, Layout e Cancelar
        Dado que o admin esta na tela de "Pop Ups"
        Quando acionar a opção "Editar" dentro de "Ações" na listagem das Pop Ups
        Então o sistema redireciona o admin para a tela de "Cadastro de Pop Ups" exibindo o ID do respectivo Pop Up na url
        E todos os dados já cadastrados são exibidos já preenchidos
        Quando o admin acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de "Pop Ups"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Adicionar dados não obrigatórios
        Dado que o admin está na tela de "Edição de Pop Ups"
        E esse Pop Up não possui campo opcional "Data Inicial" e "Data Final" preenchidos
        Quando o admin preencher com válores válidos a data e hora
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso", salva as alterações realizadas
        E redireciona o admin de volta para a listagem de "Pop Ups"
        Quando o admin acessar novamente a opção "Editar" deste Pop Up
        Então os dados exibidos estarão conforme edições realizadas
        #O botão "Salvar" estará disponível se o Pop Up estiver com a data inicial futura ou ainda não foi visualizado


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Excluir dados obrigatórios
        Dado que o admin esta na tela de "Edição de Pop Ups"
        Quando excluir informaçõe dos campos de preenchimento obrigatório: "Título" , "Conteúdo", "Mensagem de Confirmação", "Ação Positiva" e "Ação Negativa"
        E acionar o botão "Salvar"
        Então o sistema alerta a obrigatoriedade de cada campo conforme "<Resposta do sistema>"
        E não grava as alterações do pop up
        

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Editar - Campos já preenchidos
        Dado que o admin esta na tela de "Edição de Pop Ups"
        Quando alterar informaçõe dos campos 
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Pop Up salvo com sucesso"
        E grava as alterações do pop up
        E redireciona o admin de volta para a listagem de "Pop Ups"

#8 CN
