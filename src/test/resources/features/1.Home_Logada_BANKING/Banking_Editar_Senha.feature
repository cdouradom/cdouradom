#language: pt

Funcionalidade: Banking - Minha Conta - Alterar Senha e e-mail 
Como usuário ativo e logado no Banking
Quero alterar a minha Senha
Para ter controle de acesso

----- 

Critérios de Aceitação:
O usuário precisa estar logado na Plataforma do Banking
O usuário precisa preencher a senha atual correta
O usuário precisa informar a senha e uma nova senha com oito dígitos
Senha e nova senha precisam ser iguais
Não pode permitir dupliciade de email na alteração
Não pode apagar o email na alteração

---

@manual
@Tarefa_#:#59196
@Ajuste_#61110
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/B_Senha_Email_layout.png)
    Cenário: Senha e e-mail  - Acessar, Validar Layout e Cancelar
        Dado que o usuário está logado no banking
        Quando acionar o menu principal
        E selecionar o submenu "Alterar Senha"
        Então o sistema redireciona para a tela de "Senha e e-mail"
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Breadcrumbs          | Minha Conta / Senha e e-mail                                       |
            | Seção Alterar E-mail | Contendo o campo "E-mail"                                          |
            | Seção Alterar Senha  | Contendo os campos "Senha Atual", "Nova Senha" e "Confirmar Senha" |
            | Botão "Cancelar"     | redireciona pra a home banking                                     |
            | Botão "Salvar"       | valida os campos e salva                                           |
        Quando o adm acionar o botão "Cancelar" 
        Então o sistema vai redirecionar para "Home banking"



@manual
@Tarefa_#:#59196
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/B_Senha_Email_sem_preenchimento.mp4)
    Esquema do Cenário: Senha e e-mail - Campos Vazios
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        Quando não preencher os campos "<Senha Atual>", "<Senha Nova>", "<Confirmar Senha Nova>", "<Email>"
        E acionar o botão "Salvar"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
            | Senha Atual | Nova Senha | Confirmar Senha | Email             | Mensagem do Sistema                         |
            |             |            |                 | teste@teste.teste | Informe o seu e-mail; Informe a senha atual |
            |             | 123456aa   | 123456aa        | teste@teste.teste | Informe a senha atual                       |
            | 123456aa    |            | 123456aa        | teste@teste.teste | Insira uma senha                            |
            | 123456aa    | 123456aa   |                 | teste@teste.teste | Confirme a senha                            |
            | 123456aa    | 123456aa   | 123456aa        |                   | Informe o seu e-mail                        |



@manual
@Tarefa_#:#59196
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Senha_Email_email_duplicado.png),[Evidência_2](assets/B_Senha_Email_email_invalido.png),[Evidência_3](assets/B_Senha_Email_senha_atual_incorreta.png),[Evidência_4](ssets/B_Senha_Email_senha_divergente.png),[Evidência_5](assets/B_Senha_Email_senha_maior8dig.png)
    Esquema do Cenário: Senha e e-mail - Valores inválidos
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        Quando preencher os campos "<Senha Atual>", "<Senha Nova>", "<Confirmar Senha Nova>" com valores inválidos
        E acionar o botão "Salvar"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
            | Senha Atual | Nova Senha | Confirmar Senha | Email             | Mensagem do Sistema                            |
            | 'errada'    | 123456aa   | 123456aa        | teste@teste.teste | Senha incorreta                                |
            | 'certa'     | 12341234   | 56785678        | teste@teste.teste | As senhas informadas são diferentes. Verifique |
            | 'certa'     | 123        | 123             | teste@teste.teste | A senha deve conter no mínimo 8 dígitos        |
            | 'certa'     | 123456aa   | 123456aa        | teste             | E-mail inválido                                |
            | 'certa'     | 123456aa   | 123456aa        | 'já existente'    | E-mail já cadastrado                           |





@manual
@Tarefa_#:#59196
@manual-result:success
@manual-last-tested:04-10-2022
@manual-test-evidence:[Evidência](assets/B_Senha_Email_alteracao_sucesso.mp4)
    Cenário: Senha e e-mail - Nova Senha Válida
        Dado que o usuário está no formulário de "Cadastro de Nova Senha"
        E preencheu corretamento sua "Senha Atual"
        Quando digitar em "Nova Senha " e "Confirmar Senha" senha válidas, sendo igual ou maior que 8 dígitos e iguais
        E acionar o botão "Salvar"
        Então o sistema atualiza a senha do usuário
        E sinaliza com um modal com a mensagem "Senha alterada com sucesso"
        E o redireciona para "Home banking"

#4 CN
