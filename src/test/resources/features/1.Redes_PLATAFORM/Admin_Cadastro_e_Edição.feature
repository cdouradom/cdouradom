#language: pt

Funcionalidade: Admin - Cadastro e Edição de Redes
Como usuário administrador ativo na Plataforma
Quero acessar o cadastro de Redes 
Para fazer a gestão de redes da campanha

-----

Critérios de Aceitação:
Exibir breadcrumb
Acessado através da listagem de grupos
No cadastro exibir os campos de "Rede", "Grupo" e os botões "Cancelar" e "Salvar"
No cadastro não permitir duplicidade do mesmo nome de Rede na mesma campanha
No cadastro o vínculo de Rede e Grupo é 1:1
Na Edição exibir o ID da Rede bloqueado para edição
Na edição exibir os campos Rede e Grupo, permitir edição e gravar alteração realizada
Botão "Cancelar" interrompe e não realiza o cadastro e redireciona para a listagem de Grupos
Botão "Salvar" faz as validações em todos os campos e retorna com as críticas necessárias
Botão "Salvar" realiza o cadastro da Revenda na respectiva campanha e redireciona para a listagem de Revendas


---


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_cadastro_layout.mp4)
    Cenário: Cadastrar Rede - Acessar, validar Layout e Cancelar
        Dado que o admin esta na tela de Redes
        Quando acionar o botão "Cadastrar Rede"
        Então o sistema redireciona o admin para a tela de "Cadastro de Redes"
        Quando o admin visualizar todos os elementos da tela conforme abaixo
            | Breadcrumbs   | Com o Caminho para essa tela                |
            | Campo "Grupo" | select para vinculo 1:1 na Rede;            |
            | Campo "Rede"  | para cadastro do nome do grupo;             |
            | Botão         | "Cancelar" na parte inferir direita da tela |
            | Botão         | "Salvar" à frente ou abaixo dos filtros     |
        Então os elementos da tela estão alinhados corretamente    
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de Grupos   


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_cadastro_valores_invalidos.mp4)
    Esquema do Cenário: Cadastrar Rede - Valores inválidos
        Dado que o admin acessou a tela de "Cadastro de Redes"
        Quando acionar o botão "Salvar"
        Mas preencher os campos "<Grupo>" e "<Rede>" com valor inválido
        Então o sistema exibe um modal de "Erro" com a "<Mensagem do sistema>"
        E não grava nenhum registro novo
        E mantém o admin na tela de "Cadastro de Rede"
        Exemplos:
            | Grupo       | Rede        | Mensagem do Sistema |
            |             | Rede Teste  | Informe o grupo*    |
            | ' da lista' |             | Informe a rede      |
            | ' da lista' | 'duplicado' | Rede já cadastrada  |


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_cadastro_sucesso.mp4)
    Cenário: Cadastrar Rede
        Dado que o admin acessou a tela de "Cadastro de Rede"
        Quando selecionar um "Grupo"
        E preencher com valor único o campo "Rede"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Rede salva com sucesso!"
        E redireciona o admin de volta para a listagem de Redes
        E exibe a respectiva rede com ID em ordem decrescente



@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_editar_cancelar.mp4)
    Cenário: Editar Rede - Acessar, Layout e Cancelar
        Dado que o admin esta na tela de "Redes"
        Quando acionar o botão "Ações" na Listagem
        Então a opção "Editar" será exibida
        Quando o admin clicar em "Editar"
        Então o sistema redireciona para a tela de edição desta "Rede"
        E o Grupo vinculado e o nome da rede já virão preenchidos conforme cadastrado anteriormente
        E o ID da rede será exibido somente para edição
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de Grupos  


@manual
@Tarefa_#:#59189
@Ajuste_#60235
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_editar_salvar_sem_editar.mp4)
    Cenário: Editar Rede - Não Editar nada e Salvar
        Dado que o admin acessou a opção "Editar" dentro de "Ações" de uma rede existente na listagem
        Quando acionar o botão "Salvar"
        Mas sem fazer alterações
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Rede salva com sucesso!"
        E redireciona o admin de volta para a listagem de Redes 


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_editar_sucesso.mp4)
    Cenário: Editar Rede - Salvar
        Dado que o admin acessou a opção "Editar" dentro de "Ações" de um grupo existente na listagem
        Quando editar o "Grupo" e o nome da "Rede" com nome único nas redes da campanha
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Rede salva com sucesso!"
        E redireciona o admin de volta para a listagem de Redes
        E exibe a respectiva rede com ID em ordem decrescente


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Rede_editar_valor_invalido.mp4)
    Esquema do Cenário: Rede - Editar com valor inválido
        Dado que o admin acessou a opção "Editar" dentro de "Ações" de um grupo existente na listagem
        Quando alterar os campos "<Grupo>" e "<Rede>" com valores inválidos
        Então o sistema exibe um modal de "Erro" com a "<Mensagem do sistema>"
        E não grava nenhum registro novo
        E mantém o admin na tela de "Edição de Rede"
        Exemplos:
            | Grupo       | Rede        | Mensagem do Sistema |
            |             | Rede Teste  | Informe o grupo*    |
            | ' da lista' |             | Informe a rede      |
            | ' da lista' | 'duplicado' | Rede já cadastrada  |


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:05-10-2022
@manual-test-evidence:[Evidência](assets/A_Rede_log.png)
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

#8 CN
