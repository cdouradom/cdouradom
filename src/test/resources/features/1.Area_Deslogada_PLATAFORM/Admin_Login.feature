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
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_login-layout.mp4)
    Cenário: Login - Layout
        Dado que o admin acessou a url da campanha
        Quando o admin visualizar todos os elementos da tela
        Então os elementos da tela estão alinhados corretamente
            | Campo "Loguin" |
            | Campo "Senha"  |
            | Botão "Entrar" |



    @manual
        @Tarefa_#60473
        @manual-result:success
        @manual-last-tested:03-10-2022
        @manual-test-evidence:[Evidência](assets/A_login-campos-vazios.mp4)
    Esquema do Cenário: Login - Campos Vazios
        Dado que o usuário acessou a url da campanha
        Quando não preencher os campos "<Loguin>" e "<Senha>"
        E acionar o botão "Entrar"
        Então o sistema vai retornar com a "<Mensagem do Sistema>"
        Exemplos:
            | Login           | Senha    | Mensagem do Sistema      |
            |                 |          | Nenhum dado informado    |
            |                 | 123456aa | Login ou senha inválidos |
            | usuário.usuário |          | Login ou senha inválidos |



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_login-usuário-não-cadastrado.mp4)
    Cenário: Login - Usuário Não Cadastrado
        Dado que o usuário está no formulário de "Login"
        Quando digitar um usuário não cadastrado e uma senha qualquer
        E acionar o botão "Entrar"
        Então o sistema sinaliza com a mensagem "Login ou senha inválidos"



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_login-senha-incorreta.mp4)
    Cenário: Login - Senha Incorreta
        Dado que o usuário está no formulário de "Login"
        Quando digitar o usuário cadastrado e ativo
        Mas a senha incorretamente
        E acionar o botão "Entrar"
        Então o sistema sinaliza com a mensagem "Login ou senha inválidos"



    @manual
    @Tarefa_#60473
    @manual-result:success
    @manual-last-tested:03-10-2022
    @manual-test-evidence:[Evidência](assets/A_login-usuário-e-senha-corretos.mp4)
    Cenário: Login - Usuário e Senha Corretos
        Dado que o usuário está no formulário de "Login"
        Quando digitar corretamente usuário e a senha
        E acionar o botão "Entrar"
        Então o sistema vai efetivar o login
        E redirecionar para "Home" da Plataforma na url ".../Plataform/Home/index"

#5 CN
