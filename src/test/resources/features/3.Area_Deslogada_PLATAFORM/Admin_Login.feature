#language: pt


Funcionalidade: Admin - Login plataform
    Como usuário administrador cadastrado e ativo
    Quero fazer login
    Para ter acesso a Plataforma

    -----

Critérios de Aceitação:
O usuário administrador precisa estar cadastrado
O usuário precisa estar ativo na Plataforma
O usuário precisa inserir corretamente seu login e senha

    ---

@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Login - Layout
        Dado que o admin acessou a url da campanha
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Campo "Loguin" |
            | Campo "Senha"  |
            | Botão "Entrar" |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Esquema do Cenário: Login - Campos Vazios
        Dado que o usuário acessou a url da campanha
        Quando não preencher os campos "<Loguin>" e "<Senha>"
        E acionar o botão "Entrar"
        Então o sistema vai retornar com a "<Mensagem do Sistema>"
        Exemplos:
            | Login           | Senha    | Mensagem do Sistema      |
            |                 |          | Preencha este campo      |
            |                 | 123456aa | Preencha este campo      |
            | usuário.usuário |          | Preencha este campo      |


@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Login - Usuário Não Cadastrado
        Dado que o usuário está no formulário de "Login"
        Quando digitar um usuário não cadastrado e uma senha qualquer
        E acionar o botão "Entrar"
        Então o sistema sinaliza com a mensagem "Login incorreto"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Login - Senha Incorreta
        Dado que o usuário está no formulário de "Login"
        Quando digitar o usuário cadastrado e ativo
        Mas a senha incorretamente
        E acionar o botão "Entrar"
        Então o sistema sinaliza com a mensagem "Senha incorreta"



@manual
@Tarefa_#
@manual-result:
@manual-last-tested:
@manual-test-evidence:[Evidência]
    Cenário: Login - Usuário e Senha Corretos
        Dado que o usuário está no formulário de "Login"
        Quando digitar corretamente usuário e a senha
        E acionar o botão "Entrar"
        Então o sistema vai efetivar o login
        E redirecionar para "Home" da Plataforma na url ".../Plataform/Home/index"

#5 CN
