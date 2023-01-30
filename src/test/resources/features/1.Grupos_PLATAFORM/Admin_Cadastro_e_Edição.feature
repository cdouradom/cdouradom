#language: pt

Funcionalidade: Admin - Cadastro e Edição de Grupos
Como usuário administrador ativo na Plataforma
Quero acessar o cadastro de Grupos 
Para fazer a gestão de grupos da campanha

-----

Critérios de Aceitação:
Exibir breadcrumb
Acessado através da listagem de grupos
No cadastro exibri o campo de "Grupo" e os botões "Cancelar" e "Salvar"
No cadastro não permitir duplicidade de nome de Grupo na mesma campanha
Na Edição exibir o ID do Grupo bloqueado para edição
Na edição exibir o Grupo, permitir edição e gravar alteração realizada
Botão "Cancelar" interrompe e não realiza o cadastro e redireciona para a listagem de Grupos
Botão "Salvar" faz as validações em todos os campos e retorna com as críticas necessárias
Botão "Salvar" realiza o cadastro da Revenda na respectiva campanha e redireciona para a listagem de Revendas


---

@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_cadastro_layout.png)
    Cenário: Cadastrar Grupo - Acessar, alidar Layout e Cancelar
        Dado que o admin esta na tela de Grupos
        Quando acionar o botão "Cadastrar Grupo"
        Então o sistema redireciona o admin para a tela de "Cadastro de Grupo"
        Quando o admin visualizar todos os elementos da tela conforme abaixo
            | Breadcrumbs   | Com o Caminho para essa tela                |
            | Campo "Grupo" | para cadastro do nome do grupo;             |
            | Botão         | "Cancelar" na parte inferir direita da tela |
            | Botão         | "Salvar" à frente ou abaixo dos filtros     |
        Então os elementos da tela estão alinhados corretamente    
        Quando acionar o botão "Cancelar"
        Então o sistema redireciona o admin de volta para a listagem de Grupos   


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência_Campo_vazio](assetsA_Grupo_cadastro_campo_vazio.png),[vidência_Campo_duplicado](assets/A_Grupo_cadastro_duplicidade.png)
    Esquema do Cenário: Cadastrar Grupo - Valor inválido
        Dado que o admin acessou a tela de "Cadastro de Grupos"
        Quando acionar o botão "Salvar"
        Mas preencher o campo "<Grupo>" com valor inválido
        Então o sistema exibe um modal de "Erro" com a "<Mensagem do sistema>"
        E não grava nenhum registro novo
        E mantém o admin na tela de "Cadastro de Grupos"
        Exemplos:
            | Grupo       | Mensagem do Sistema |
            |             | Preencha este campo |
            | 'duplicado' | Grupo já cadastrado |


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_cadastro_sucesso.png)
    Cenário: Cadastrar Grupo 
        Dado que o admin acessou a tela de "Cadastro de Grupos"
        Quando preencher com valor único o campo "Grupos"
        E acionar o botão "Salvar"
        Então o sistema exibe um modal de "Sucesso" com a mensagem "Grupo salvo com sucesso!"
        E redireciona o admin de volta para a listagem de Grupos
        E exibe o respectivo grupo com ID em ordem decrescente


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_editar_cancelar.mp4)
    Cenário: Grupos - Editar Acessar, Layout e Cancelar
    Dado que o admin esta na tela de "Grupos"
    Quando acionar o botão "Ações" na Listagem
    Então a opção "Editar" será exibida
    Quando o admin clicar em "Editar"
    Então o sistema redireciona para a tela de edição deste "Grupo"
    E o nome do grupo já virá preenchido conforme cadastrado anteriormente
    E o ID do grupo será exibido somente para edição
    Quando o admin visualizar todos os elementos da tela
    Então os elementos da tela estão alinhados corretamente
    Quando acionar o botão "Cancelar"
    Então o sistema redireciona o admin de volta para a listagem de Grupos  


@manual
@Tarefa_#:#59189
@Ajuste_#60205
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_editar_salvar_sem_editar.mp4)
    Cenário: Grupos - Não Editar nada e Salvar
    Dado que o admin acessou a opção "Editar" dentro de "Ações" de um grupo existente na listagem
    Quando acionar o botão "Salvar"
    Mas sem alterar o nome do grupo
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Grupo salvo com sucesso!"
    E redireciona o admin de volta para a listagem de Grupos 


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_editar_salvar.mp4)
    Cenário: Grupos - Editar e Salvar
    Dado que o admin acessou a opção "Editar" dentro de "Ações" de um grupo existente na listagem
    Quando editar somente o nome do "Grupo" com nome único
    E acionar o botão "Salvar"
    Então o sistema exibe um modal de "Sucesso" com a mensagem "Grupo salvo com sucesso!"
    E redireciona o admin de volta para a listagem de Grupos
    E exibe o novo nome no ID do grupo alterado


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência_1](assets/A_Grupo_editar_campo_vazio.png),[Evidência_2](assets/A_Grupo_editar_duplicidade.png)
    Esquema do Cenário: Grupos - Editar com valor inválido
        Dado que o admin acessou a opção "Editar" dentro de "Ações" de um grupo existente na listagem
        Quando preencher o campo "<Grupo>" com valor inválido
        Então o sistema exibe um modal de "Erro" com a "<Mensagem do sistema>"
        E não faz nenhuma modificação no registro
        E mantém o admin na tela de "Edição deste Grupo" 
        Exemplos:
            | Grupo       | Mensagem do Sistema |
            |             | Preencha este campo |
            | 'duplicado' | Grupo já cadastrado |


@manual
@Tarefa_#:#59189
@manual-result:success
@manual-last-tested:29-09-2022
@manual-test-evidence:[Evidência](assets/A_Grupo_log.png)
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