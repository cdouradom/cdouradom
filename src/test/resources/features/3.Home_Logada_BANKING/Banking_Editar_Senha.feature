#language: pt

Funcionalidade: Banking - Minha Conta - Alterar Senha e e-mail 
Como usuário ativo e logado no Banking
Quero alterar a minha Senha
Para ter controle de acesso

----- 

Critérios de Aceitação:
O usuário precisa estar logado na Plataforma do Banking
O usuário precisa preencher a senha atual correta
O usuário precisa informar a senha e uma nova senha com no minimo oito dígitos
Senha e confirmar senha precisam ser iguais
    Não pode permitir dupliciade de email na alteração
    Não pode apagar o email na alteração

SELECT * FROM `account ` where document = '' ;
---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Senha   - Acessar, Validar Layout e Cancelar
        Dado que o usuário está logado no banking
        Quando acionar o menu principal
        E selecionar o submenu "Minha Conta " > "Alterar Senha"
        Então o sistema redireciona para a tela de "Alterar Senha"
        Quando o usuário visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs         | Minha Conta / Alterar Senha                                        |
            | Seção Alterar Senha | Contendo os campos "Senha Atual", "Nova Senha" e "Confirmar Senha" |
            | Botão "Cancelar"    | redireciona pra a home banking                                     |
            | Botão "Salvar"      | valida os campos e salva                                           |
        Quando o adm acionar o botão "Cancelar" 
        Então o sistema vai redirecionar para "Home banking"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Senha - Campos Vazios
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        Quando não preencher os campos "<Senha Atual>", "<Senha Nova>", "<Confirmar Senha Nova>", "<Email>"
        E acionar o botão "Salvar"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
            | Senha Atual | Nova Senha | Confirmar Senha | Mensagem do Sistema   |
            |             |            |                 | Informe a senha atual |
            |             | 123456aa   | 123456aa        | Informe a senha atual |
            | 123456aa    |            | 123456aa        | Insira uma senha      |
            | 123456aa    | 123456aa   |                 | Insira uma senha      |



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Senha e - Valores inválidos
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        Quando preencher os campos "<Senha Atual>", "<Senha Nova>", "<Confirmar Senha Nova>" com valores inválidos
        E acionar o botão "Salvar"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
            | Senha Atual | Nova Senha | Confirmar Senha | Mensagem do Sistema                            |
            | 'errada'    | 123456aa   | 123456aa        | Senha incorreta                                |
            | 'certa'     | 12341234   | 56785678        | As senhas informadas são diferentes. Verifique |
            | 'certa'     | 123        | 123             | A senha deve conter no mínimo 8 dígitos        |
            | 'certa'     | 123456aa   | 123456aa        | E-mail inválido                                |
            | 'certa'     | 123456aa   | 123456aa        | E-mail já cadastrado                           |





@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Senha - Nova Senha Válida
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        E preencheu corretamento sua "Senha Atual"
        Quando digitar em "Nova Senha " e "Confirmar Senha" senha válidas, sendo igual ou maior que 8 dígitos e iguais
        E acionar o botão "Salvar"
        Então o sistema atualiza a senha do usuário
        E sinaliza com um modal com a mensagem "Senha alterada com sucesso"
        E o redireciona para "Home banking"

#4 CN
