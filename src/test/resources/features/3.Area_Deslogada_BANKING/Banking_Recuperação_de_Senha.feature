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
O envio deve ser feito para o email ou SMS do usuário cadastrado e ativo na campanha


---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Acessar, Validar Layout e Voltar
        Dado que o usuário acessou a tela de "Login"
        Quando acionar o botão "Esqueceu sua senha?"
        Entao o sistema redireciona para tela de "Recuperação de Senha" na url ".../Account/passForgot"
        E evidencia os elementos abaixo
            | Texto Informativo | Para recuperar a senha, precisamos que você nos forneça a seguinte informação: |
            | Campo             | "CPF/CNPJ"                                                                     |
            | Botões            | "Enviar" e "Voltar"                                                            |
        Quando o usuário acionar o botão "Voltar"
        Então o sistema redireciona o usuário de volta para a tela de login (Área deslogada)


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Valor inválido
        Dado que o usuário acessou a tela de "Recuperação de Senha" 
        Mas não preencher o campo "CPF/CNPJ"
        Quando acionar o botão "Enviar"
        Então o sistema vai retornar com a mensagem "Preencha este campo" no campo "CPF/CNPJ"
        Quando o usuário preencher o campo "CPF/CNPJ" com um documento não cadastrado
        E acionar o botão "Enviar" 
        Então o sistema vai retornar um modal de "Erro" com a mensagem
        |Falha de Autenticação. Clique em primeiro acesso.|
        Quando o usuário fechar este modal de "Erro"
        Então o sistema o permanece na mesma tela


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Esquema do Cenário: Recuperação de Senha - Status diferente de Ativo
        Dado que o usuário acessou a tela de "Recuperação de Senha" 
        E preencheu o campo "CPF/CNPJ" com um documento de um usuário diferente de "Ativo"
        Quando acionar o botão "Enviar"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
            | <CPF>          | <Status>                 | <Mensagem do Sistema>                                                   |
            | 000.000.000-00 | Inativo                  | Falha de Autenticação                                                   |
            | 999.999.999-99 | Pendente                 | Falha de Autenticação                                                   |
            | 333.333.333-33 | Suspenso Temporariamente | Falha de autenticação. Entre em contato com o administrador da campanha |
    #CPFs de exemplo. Use os documentos da base de dados
    #verificar máscara de CPF no campo


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Por email - Usuário Ativo
        Dado que o usuário acessou a tela de "Recuperação de Senha" 
        E preencheu o campo "CPF/CNPJ" com um documento de um usuário "Ativo"
        Quando acionar o botão "Enviar"
        Então o sistema exibe o modal "Recuperação de Senha" com os seguintes elementos
            |Texto informativo| Como você prefere recuperar sua senha?|
            |Campos | "Email" (email do usuário) com prefixo mascarado e "SMS" (celular do usuário) com números mascarados|
            |Botão| Enviar|
        Quando o usuário acionar a opção "Email"  
        E acionar o botão "Enviar"
        Então o sistema exibe o modal "Informação" com o texto: "Um link de redefinição de senha foi enviado para o email "X" (e-mail do usuário)"
        Quando o usuário fechar este modal
        Então o sistema redireciona o usuário de volta para a tela de login (Área deslogada)
        E efetua o disparo do e-mail de recuperação para o usuário com um hash de uso único para cadastro de nova senha
   

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Link recebido pelo Email - Cadastrar nova senha
        Dado que o usuário acessou o e-mail
        Quando acionar o link existente no e-mail recebido
        Então o sistema redirecionará para a url do formulário "Recuperar a minha senha" com o hash desta requisição na url
        Quando preencher os campos "Nova Senha" e "Confirme a senha" com senhas válidas #>=8 dígitos e senhas iguais 
        E acionar o botão "Confirmar"
        Então o sistema vai exibir um modal de sucesso com a mensagem "Senha atualizada com sucesso! Faça o login com sua nova senha."
        Quando o usuário fechar este modal
        Então o sistema redireciona o usuário para a "Home" deslogada
        Quando o usuário preencher o campo "CPF/CNPJ"
        E preencher a nova senha recém alterada
        E acionar o botão "Entrar"
        Então o sistema vai efetivar o login 
        E redirecionar para "Home" logada do banking na url ".../Banking/Home"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Por SMS - Usuário Ativo
        Dado que o usuário acessou a tela de "Recuperação de Senha" 
        E preencheu o campo "CPF/CNPJ" com um documento de um usuário "Ativo"
        Quando acionar o botão "Enviar"
        Então o sistema exibe o modal "Recuperação de Senha" com os seguintes elementos
            |Texto informativo| Como você prefere recuperar sua senha?|
            |Campos | "Email" (email do usuário) com prefixo mascarado e "SMS" (celular do usuário) com números mascarados|
            |Botão| Enviar|
        Quando o usuário acionar a opção "SMS"  
        E acionar o botão "Enviar"
        Então o sistema exibe o modal "Informação" com o texto: "Um link de redefinição de senha foi enviado para o telefone "X" (celular do usuário)"
        Quando o usuário fechar este modal
        Então o sistema redireciona o usuário de volta para a tela de login (Área deslogada)
        E efetua o disparo do SMS de recuperação para o usuário com um hash de uso único para cadastro de nova senha

   
@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Link recebido pelo SMS - Cadastrar nova senha
        Dado que o usuário recebeu o link de recuperação de senha recebido pelo SMS
        Quando acionar o link 
        Então o sistema redirecionará para a url do formulário "Recuperar a minha senha" com o hash desta requisição na url
        Quando preencher os campos "Nova Senha" e "Confirme a senha" com senhas válidas #>=8 dígitos e senhas iguais 
        E acionar o botão "Confirmar"
        Então o sistema vai exibir um modal de sucesso com a mensagem "Senha atualizada com sucesso! Faça o login com sua nova senha."
        Quando o usuário fechar este modal
        Então o sistema redireciona o usuário para a "Home" deslogada
        Quando o usuário preencher o campo "CPF/CNPJ"
        E preencher a nova senha recém alterada
        E acionar o botão "Entrar"
        Então o sistema vai efetivar o login 
        E redirecionar para "Home" logada do banking na url ".../Banking/Home"


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Esquema do Cenário: Alteração de Senha - Valores Inválidos
        Dado que o usuário acessou o link de recuperação recebido no e-mail
        Quando não preencher os campos "<Nova Senha>" e "<Confirme a sua nova senha>"
        E acionar o botão "Entrar"
        Então o sistema vai retornar "<Mensagem do Sistema>"
        Exemplos:
            | <Nova Senha> | <Confirme a sua nova senha> | <Mensagem do Sistema>             |
            |              |                             | Preencha este campo               |
            | 123456aa     |                             | Preencha este campo               |
            |              | 123456aa                    | Preencha este campo               |
            | 789456bb     | 123456aa                    | Este campo deve ser igual à senha |
            | 123          | 123                         | Tamanho mínimo: 8 caracteres      |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:assets/
    Cenário: Recuperação de Senha - Link já utilizado/expirado
        Dado que o usuário recebeu o link de recuperação de senha
        E já fez a alteração da senha utilizando esse link recebido
        Quando clicar neste link novamente
        Então o sistema redirecionará para a url da "Home" deslogada
        E o sistema exibe o modal "Erro" com a mensagem "Token inválido!"
