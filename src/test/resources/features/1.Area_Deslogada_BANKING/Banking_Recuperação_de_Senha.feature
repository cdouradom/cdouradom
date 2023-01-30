#language: pt 


Funcionalidade: Banking - Recuperação de Senha
Como usuário cadastrado e ativo na campanha
Quero realizar a recuperação de senha
Para cadastrar nova senha e acessar a campanha


Critérios de Aceitação:
O usuário precisa estar cadastrado na campanha
O usuário precisa estar com status ativo 
O usuário precisa informar o CPF
O sistema precisa bloquear o envio para CPF's com status diferente de ativo
O envio deve ser feito para o email do usuário cadastrado e ativo na campanha



---

@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Rec_de_senha_layout.png)
    Cenário: Recuperação de Senha - Acessar, Validar Layout e Cancelar
        Dado que o usuário acessou a tela de "Login"
        Quando acionar o botão "Esqueceu a senha?"
        Entao o sistema redireciona para tela de "Recuperar Senha" na url ".../Home/forgotPassword"
        E evidencia os elementos abaixo
                | Campo "CPF"     |
                | Botão "Voltar"  |
                | Botão "Avançar" |
        Quando o usuário acionar o botão "Voltar para o login"
        Então o sistema redireciona o usuário de volta para a etapa dos banners, sendo a "1º etapa da área deslogada"



@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Rec_de_senha_sem_CPF.png),[Evidência_2](assets/B_Rec_de_senha_CPF_invalido.png)
    Cenário: Recuperação de Senha - Valor inválido
        Dado que o usuário acessou a tela de "Recuperar Senha" 
        Quando o usuário acionar o botão "Recuperar Senha" 
        Mas não preencher o campo "CPF"
        Então o sistema vai retornar com a mensagem "Preencha este campo" no campo CPF
        Quando o usuário preencher o campo "CPF" com um documento não cadastrado
        E acionar o botão "Avançar" 
        Então o sistema vai retornar um modal de "Erro" com a mensagem
        |Esta conta não possui cadastro na plataforma. Por favor, cadastre-se ou verifique o documento informado.|
        Quando o usuário fechar esse modal de "Erro"
        Então o sistema o mantém na mesma tela



@manual
@Tarefa_#:#59195
@Sugestão_#60769
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Rec_de_senha_CPF_INATIVO.png),[Evidência_2](assets/B_Rec_de_senha_CPF_PENDENTE.png),[Evidência_3](assets/B_Rec_de_senha_CPF_SUSPENSO.png)
    Esquema do Cenário: Recuperação de Senha - Status diferente de Ativo
        Dado que o usuário acessou a tela de "Recuperar Senha"
        Quando informar o "<CPF>" com "<Status>" que não seja Ativo
        E acionar o botão "Recuperar Senha"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
                | <CPF>          | <Status>                 | <Mensagem do Sistema>                                                   |
                | 000.000.000-00 | Inativo                  | Falha de Autenticação                                                   |
                | 999.999.999-99 | Cadastro Pendente        | Usuário e/ou senha inválidos                                            |
                | 333.333.333-33 | Suspenso Temporariamente | Falha de autenticação. Entre em contato com o administrador da campanha |
    #verificar máscara de CPF no campo


@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Rec_de_senha_msg.png),[Evidência_2](assets/B_Rec_de_senha_email.png)
    Cenário: Recuperação de Senha - Usuário Ativo
        Dado que o usuário está no formulário de "Recuperar Senha"
        Quando digitar um "CPF" cadastrado com status ativo
        E acionar o botão "Recuperar Senha"
        Então o sistema vai retornar com a mensagem abaixo
        | Enviamos um link de recuperação de senha para o seu e-mail. Esta recuperação pode levar até 30 minutos para chegar em sua caixa de entrada. Não se esqueça também de checar sua caixa de spam.|
        | Caso esteja com dificuldades em receber o link de recuperação, entre em contato com administrador da campanha.|
        E um botão "Ok"
        E faz o disparo do e-mail para o usuário com um hash de uso único para cadastro de nova senha
        Quando o usuário clicar em "Ok"
        Então o sistema redireciona o usuário de volta para a etapa dos banners, sendo a "1º etapa da área deslogada"

   

@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Rec_de_senha_nova_senha.png),[Evidência_2](assets/B_Rec_de_senha_senha_alterada.png),[Evidência_3](assets/B_Rec_de_senha_login_apos_rec.png)
    Cenário: Recuperação de Senha - Cadastrar nova senha
        Dado que o usuário acessou o e-mail
        Quando acionar o link existente no e-mail recebido
        Então o sistema redirecionará para a url do formulário "Alteração de senha" com o hash desta requisição na url
        Quando preencher os campos "Nova Senha" e "Confirmação de nova senha" com senhas válidas #>=8 dígitos e senhas iguais 
        E acionar o botão "Confirmar"
        Então o sistema vai exibir um modal com a mensagem "Senha alterada com sucesso. Você já pode logar com sua nova senha"
        E redireciona o usuário para a "Home" deslogada
        Quando o usuário acessar a tela de "Login"
        E preencher o "CPF"
        E preencher a nova senha recém alterada
        E acionar o botão "Entrar"
        Então o sistema vai efetivar o login 
        E redirecionar para "Home" do banking na url ".../Banking/Home/dashboard"
        #Obs. Ci: não consegui fazer na mondial, se necessário ajustar cenário conforme fluxo que atenda aos requisitos



@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Rec_de_senha_sem_senha.png),[Evidência_2](assets/B_Rec_de_senha_sem_confirmar_senha.png),[Evidência_3](assets/B_Rec_de_senha_menor8dig.png),[Evidência_4](assets/B_Rec_de_senha_senha_divergente.png),
    Esquema do Cenário: Alteração de Senha - Valores Inválidos
        Dado que o usuário acessou o link de recuperação recebido no e-mail
        Quando não preencher os campos "<Nova Senha>" e "<Confirme a sua nova senha>"
        E acionar o botão "Entrar"
        Então o sistema vai retornar "<Mensagem do Sistema>"
        Exemplos:
            | <Nova Senha> | <Confirme a sua nova senha> | <Mensagem do Sistema>                        |
            |              |                             | Campo obrigatório                            |
            | 123456aa     |                             | Campo obrigatório                            |
            |              | 123456aa                    | Campo obrigatório                            |
            | 789456bb     | 123456aa                    | As senha não são iguais                      |
            | 123          | 123                         | A senha deve possuir pelo menos 8 caracteres |


@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Rec_de_senha_Hash_inválido..png)
    Cenário: Recuperação de Senha - Link já utilizado/expirado
        Dado que o usuário recebeu o link de recuperação de senha
        E já fez a alteração da senha utilizando esse link recebido
        Quando clicar neste link novamente
        Então o sistema redirecionará para a url do formulário "Alteração de senha" com o hash da requisição na url
        Mas o sistema exibe uma tela com a mensagem "O hash está expirado" ou algo similar


#7 CN