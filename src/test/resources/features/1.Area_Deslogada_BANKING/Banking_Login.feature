#language: pt 


Funcionalidade: Banking - Área deslogada e Tela de login
Como usuário cadastrado e ativo na campanha
Quero acessar a url da campanha
Para realizar meu login e ter acesso ao ambiente banking

-----

Critérios de Aceitação:
O usuário precisa estar cadastrado na campanha
O usuário precisa estar com status ativo 
O usuário precisa preencher os campos de login e senha corretamente
O sistema precisa bloquear o login de usuários com status diferente de ativo
O área deslogada tem estrutura de duas etapas
Em todas as 3 etapas os elemente devem ser disponibilizados: "Login" e "Quero me cadastrar"
O carrossel possui transição visível e clicável tanto nas 'setas' como no 'tablist'
Fazer bloqueio de login após 5 tentativas de senha incorreta
Desbloquear o login automaticamente após 30 minutos do bloqueio


---

@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Modal_Cookies_Recaptcha.mp4)
    Cenário: Área deslogada - Modal Cookies e Recaptcha
        Dado o seguinte fluxo
        Quando o usuário acessar a url da campanha na visão do Banking
        Então o sistema exibe a home deslogada
        E um modal na parte inferior da tela com a mensagem de aceite de cookies abaixo
        |“Este site utiliza cookies (próprios e de terceiros) e tecnologias similares para analisar os nossos serviços e exibir publicidade personalizada com base em um perfil elaborado a partir dos seus hábitos de navegação (por exemplo, páginas visitadas). Consulte a Política de Privacidade e Política de Cookies para obter mais informações”|
        Quando clicar em “Política de privacidade”
        Então uma nova aba deverá abrir no navegador com as políticas de privacidade
        Quando clicar em “Política de cookies”
        Então uma nova aba deverá abrir no navegador com as políticas de cookies
        Quando clicar no Botão “Aceitar” do modal
        Então o modal não aparecerá mais naquela sessão
        Mas enquanto o usuário não aceitar, o modal fica aparecendo para o usuário
        E quando houver a limpeza dos cookies no navegador, o modal voltará a ser exibido na página
        Quando o usuário acessar a url da campanha na visão do Banking
        Então o sistema exibe o ícone de "reCAPTCHA"
        Quando o usuário passa o mouse no ícone
        Então ele expande exibindo os links de "Privacidade" e "Termos" do Google
        Quando o usuário aciona os links
        Então as tela de "Política de Privacidade do Google" e "Termos de Serviço do Google" são abertas em novas abas do navegador



@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Home_tela_login.png)
    Cenário: Área deslogada - Layout e Login
        Dado o seguinte fluxo
        Quando o usuário acessar a url da campanha na visão do Banking
        Então o sistema exibe um carrossel com 3 banners com transição ao clique #imagens e textos conforme XD
        E em todas as 3 etapas/banners os botões "Fazer Login" e "Quero me cadastrar" serão disponibilizados
        E no rodapé os textos centralizados conforme abaixo
        |“Sistema de pontuação Clube Aiwa”|
        |“© 2022. Todos os direitos reservados”|
        Quando o usuário acionar o botão "Fazer Login" em todas as 3 etapas/banners
        Então o sistema redireciona o usuário para a tela de login com os elementos na Tela
            | Texto "Bem-vindo(a) ao CLUBE AIWA...." |                                                              |
            | Botão "Saiba Mais"                     | clique > redireciona para a etapa dos banners (anterior)     |
            | Campo "CPF"                            |                                                              |
            | Campo "Senha"                          |                                                              |
            | Botão "Entrar"                         | clique > valida os campos de CPF e Senha                     |
            | Botão "Primeito Acesso"                | clique > redireciona para a 1º etapa do primeiro acesso      |
            | Botão "Esqueceu a Senha?"              | clique > redireciona para a 1º etapa da recuperação de senha |
    #Texto completo Bem-vindo(a) ao CLUBE AIWA: 
        #Bem-vindo(a) ao CLUBE AIWA. 
        #Aqui você tem uma ferramenta para atingir a excelência e performance nas vendas, contando com um programa completo de recompensas. 
        #Escolha inteligente é contar com a gente! 


@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Home_tela_login_sem_CPF.png),[Evidência_2](assets/B_Home_tela_login_sem_senha.png)
    Esquema do Cenário: Login - Campos Vazios
        Dado que o usuário acessou a url do Banking
        E acionou o botão "Fazer Login"
        Quando acionar o botão "Entrar"
        Mas não preencher os campos "<CPF>" e a "<Senha>"
        Então o sistema vai retornar a "<Mensagem do Sistema>"
        Exemplos:
                | <CPF>       | <Senha>     | <Mensagem do Sistema> |
                |             |             | Preencha este campo   |
                |             | "preencher" | Preencha este campo   |
                | "preencher" |             | Preencha este campo   |



@manual
@Tarefa_#:#59195
@Sugestão_#60755
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Home_tela_login_CPF_Inativo.png),[Evidência_2](assets/B_Home_tela_login_CPF_Suspenso_Temporariamente.png),[Evidência_3](assets/B_Home_tela_login_CPF_pendente.png)
    Esquema do Cenário: Login - Status diferente de Ativo
        Dado que o usuário está no formulário de "Login"
        Quando informar o "<CPF>" com "<Status>" que não seja Ativo
        E preencher a "<Senha>"
        E acionar o botão "Entrar"
        Então o sistema vai retornar "<Mensagem do Sistema>"
        Exemplos:
                | <CPF>          | <Status>                 | <Senha>  | <Mensagem do Sistema>                                                   |
                | 000.000.000-00 | Inativo                  | 123456aa | Falha de Autenticação                                                   |
                | 999.999.999-99 | Cadastro Pendente        | 123456aa | Usuário e/ou senha inválidos                                            |
                | 333.333.333-33 | Suspenso Temporariamente | 123456aa | Falha de autenticação. Entre em contato com o administrador da campanha |
        #verificar máscara de CPF no campo


@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Home_tela_login_sem_senha.png)
    Cenário: Login - Senha Incorreta
        Dado que o usuário está no formulário de "Login"
        Quando informar o CPF de um usuário cadastrado e ativo 
        Mas a digitar uma senha errada
        E acionar o botão "Entrar"
        Então o sistema sinaliza com a mensagem "Usuário e/ou senha inválidos"




@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência_1](assets/B_Home_tela_login_sem_senha.png),[Evidência_2](assets/B_Home_tela_login_senha_incorreta_2.png),[Evidência_3](assets/B_Home_tela_login_senha_incorreta_3.png),[Evidência_4](assets/B_Home_tela_login_senha_incorreta_4.png),[Evidência_5](assets/B_Home_tela_login_senha_incorreta_5.png)
    Cenário: Login - Bloqueio por senha incorreta 5x
        Dado que o usuário está no formulário de "Login"
        Quando informar o CPF de um usuário "cadastrado e ativo"
        Mas digitar uma "senha errada por 5x"
        E acionar o botão "Entrar"
        Então o sistema sinaliza com a mensagem "Usuário e/ou senha inválidos. Você já realizou <n> de 5 tentativas." em um modal
        E a cada tentativa de acesso com senha incorreta, o campo "<n>"" deve ser apresentado de forma incremental, iniciando em 1 e finalizando em 4."
        E na 5º tentativa de acesso sem sucesso, apresentar o modal com a mensagem "Sua conta foi bloqueada. Entre em contato com o CAC"
        Quando o usuário continuar tentando acessar durante os 30 minutos seguintes
        Então o sistema permanece exibindo o modal com a mensagem "Sua conta foi bloqueada. Entre em contato com o CAC"
        Mas seu login será automaticamente desbloqueado após "30 minutos" do bloqueio
        Quando após os 30 minutos o usuário tentar acessar novamente
        E continuar digitando a senha incorreta
        Então o sistema inicia novamente a contagem a cada tentativa



@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Home_tela_login_senha_bloqueada.png)
    Cenário: Login - Desbloqueio após 30 minutos
        Dado que o usuário bloqueou seu login por 5 tentativas com senha incorreta
        Mas foi desbloqueado após "30 minutos" do bloqueio
        Quando o usuário tentar acessar novamente
        E preencher corretamente seu login e senha
        Então o sistema vai efetivar o login 
        E redirecionar para "Home" do banking na url ".../Banking/Home/dashboard"



@manual
@Tarefa_#:#59195
@manual-result:success
@manual-last-tested:03-10-2022
@manual-test-evidence:[Evidência](assets/B_Login_login_valido.mp4)
    Cenário: Login - Válido
        Dado que o usuário está no formulário de "Login"
        Quando informar o CPF de um usuário cadastrado e ativo 
        E preencher a senha correta
        E acionar o botão "Entrar"
        Então o sistema vai efetivar o login 
        E redirecionar para "Home" do banking na url ".../Banking/Home/dashboard"


#8 CN