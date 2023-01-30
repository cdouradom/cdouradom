#language: pt

Funcionalidade: Admin - Alterar Senha
    Como usuário administrador ativo e logado na Plataforma
    Quero alterar a minha Senha
    Para ter controle de acesso


    Critérios de Aceitação:
    O usuário administrador precisa estar logado na Plataforma
    O usuário precisa preencher a senha atual correta
    O usuário precisa informar a senha e uma nova senha com oito dígitos
    Senha e nova senha precisam ser iguais



@manual
@Tarefa_#60473
@Sugestão_#60768
@manual-result:success
@manual-last-tested:07-10-2022
@manual-test-evidence:[Evidência](assets/A_alterar-senha-acessar-validar-layout-e-cancelar_V2.mp4)
    Cenário: Alterar Senha - Acessar, Validar Layout e Cancelar
        Dado que o admin acessou a Plataforma
        Quando o admin acionar o menu no avatar "Olá, admin teste"
        E acionar a opção "Alterar Senha"
        Então o sistema redireciona para a tela de "Cadastro de Nova Senha"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
        | Breadcrumbs                 | Home / Alterar Senha                                                    |
        | Cadastro de Nova Senha      | Contendo os campos "Senha Atual", "Senha Nova" e "Confirmar Senha Nova" |
        | Botão "Cancelar"            |                                                                         |
        | Botão "Salvar"              |                                                                         |
        Quando o adm acionar o botão "Cancelar"
        Então o sistema vai redirecionar para "Home"



    @manual
        @Tarefa_#60473
        @manual-result:success
        @manual-last-tested:03-10-2022
        @manual-test-evidence:[Evidência](assets/A_alterar-senha-campos-vazios.mp4)
    Esquema do Cenário: Alterar Senha - Campos Vazios
        Dado que estou logado na Plataforma
        Quando não preencher os campos "<Senha Atual>", "<Senha Nova>", "<Confirmar Senha Nova>"
        E acionar o botão "Salvar"
        Então o sistema vai retornar "<Mensagem do Sistema>"
        Exemplos:
            | Senha Atual | Senha Nova | Confirmar Senha Nova | Mensagem do Sistema                         |
            |             |            |                      | A senha deve conter pelo menos 8 caracteres |
            |             | 123456aa   | 123456aa             | Senha incorreta                             |
            | 123456aa    |            | 123456aa             | As senhas não são iguais                    |
            | 123456aa    | 123456aa   |                      | As senhas não são iguais                    |



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_alterar-senha-senha-incorreta.mp4)
    Cenário: Alterar Senha - Senha Incorreta
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        Quando digitar incorretamente a senha atual
        E clicar em "Salvar"
        Então o sistema sinaliza com a mensagem "Senha incorreta"



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_alterar-senha-senha-nova-e-confirmar-senha-nova-digitadas-com-valores-diferentes.mp4)
    Cenário: Alterar Senha - Senha Nova e Confirmar Senha Nova digitadas com valores diferentes
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        E preencheu corretamento a "Senha Atual"
        Quando digitar em "Senha Nova" e "Confirmar Senha Nova" valores diferentes
        E clicar em "Salvar"
        Então o sistema sinaliza com a mensagem "As senhas não são iguais"


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_alterar-senha-nova-senha-com-caracteres-insuficientes.mp4)
    Cenário: Alterar Senha - Nova Senha com caracteres insuficientes
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        E preencheu corretamento a "Senha Atual"
        Quando digitar em "Senha Nova" e "Confirmar Senha Nova" caracteres com a quantidade inferior a 8 dígitos
        E clicar em "Salvar"
        Então o sistema sinaliza com a mensagem "A senha deve conter pelo menos 8 caracteres"


    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_alterar-senha-nova-senha-válida.mp4)
    Cenário:  Alterar Senha - Nova Senha Válida
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        E preencheu corretamento a "Senha Atual"
        Quando digitar em "Senha Nova" e "Confirmar Senha Nova" caracteres válidos
        E com a quantidade correta de no mínimo 8 caracteres
        E clicar em "Salvar"
        Então o sistema atualiza a senha do adm
        E redireciona para "Home"
        E sinaliza com o modal com a mensagem "Senha alterada com sucesso"


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

#7CN
