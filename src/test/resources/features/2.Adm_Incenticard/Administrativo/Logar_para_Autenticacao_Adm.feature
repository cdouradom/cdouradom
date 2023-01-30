#language: pt

Funcionalidade: Logar para Autenticação Adm
Cenário testado: Validar Layout Incenticard Administrativo - Dica: o botão de logar é o único que não está escrito todo em maiúsculo como os outros.
Pergunta: Posso testar alterando a senha?

testado 02/03

Cenário: Acessar aréa de Login
    Dado o Usuário está acessando a internet
    Quando acessa o site "https://incenticard-backoffice.teste.proponto.com.br/login"
    Então a página é aberta Incenticard
    E é exibida a tela de "Login"
    E o fluxo é encerrado

Cenário: IDENTIFIQUE-SE- Layout
    Dado o Usuário está na "página de Login" 
    Quando ele visualiza o Layout da página
    Então os elementos da página estão centralizados corretamente
    E o fluxo é encerrado

Cenário: Logar para autenticação Adm
    Dado o Usuário está na "página de Login" 
    E insere um "USUÁRIO" e "SENHA" válidos
            |USUÁRIO|SENHA|
            |admin.bestcode|*****|
    Quando ele aciona o botão "LOGAR"
    Então é exibida a mensagem "Aguarde" no botão de logar
    E o login é feito
    E o sistema renderiza a página para a tela "Dashboard" com um resumo dos serviços que foram feitos
    E o fluxo é encerrado

Cenário: Login para autenticação Adm - Usuário/e ou senha inválido (1/2 tentativas)
    Dado o Usuário está na "página de Login" 
    E insere um "USUÁRIO" e "SENHA" inválidos
            |USUÁRIO|SENHA|
            |admin.bestcode|585885|
    Quando ele aciona o botão "LOGAR"
    Então é exibida a mensagem "Usuário ou senha invalidos, tentativa 2/3" em vermelho
    E não é possível fazer login
    E o fluxo é encerrado

Cenário: Login para autenticação Adm - Usuário/e ou senha inválido (3 tentativas) 
    Dado o Usuário está na "página de Login" 
    E insere um "USUÁRIO" e "SENHA" inválidos
            |USUÁRIO|SENHA|
            |admin.bestcode|00002|
    Quando ele aciona o botão "LOGAR"
    Então é exibida a mensagem "reCAPTCHA inválido" em vermelho
    E não é possível fazer login
    E o fluxo é encerrado

Cenário: Logar com valores não prenchidos
    Dado o Usuário está na "página de Login" 
    E não preenche os campos "USUÁRIO" e/ou "SENHA" 
            |teste|USUÁRIO|SENHA|
            |1|ㅤ|585885|
            |2|admin.bestcode|ㅤ|
    Quando ele aciona o botão "LOGAR"
    Então é exibida a mensagem "Preencha este campo."
    E não é possívelfazer "Login"
    E o fluxo é encerrado

Cenário: Alterar Senha Adm

Cenário: Alterar Senha inválida Adm

Cenário: Cancelar Alteração de Senha Adm

Cenário: Desconectar da página